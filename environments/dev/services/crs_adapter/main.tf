# EC2 Configuration
resource "aws_instance" "crs_adapter" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.ec2_private_subnet_id
  vpc_security_group_ids = var.security_group_ids_ec2
  iam_instance_profile   = data.aws_iam_instance_profile.ec2_instance_profile.name

  user_data = base64encode(
    templatefile("user_data.txt", {
      directoryId   = "d-123"
      directoryName = "steblynskyi.local"
      directoryOU   = "OU=${var.OU},OU=Servers - AWS,DC=steblynskyi,DC=local"
    })
  )

  associate_public_ip_address = false
  disable_api_termination     = true


  root_block_device {
    volume_type = "standard"
    volume_size = "100"
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name        = local.app_env
    Environment = var.environment
    Terraform   = var.tag_terraform
    Domain      = local.app_domain
  }
}

# ALB Config
resource "aws_lb" "alb" {
  name     = local.app_env
  internal = false

  load_balancer_type = "application"
  security_groups    = var.security_group_ids_alb

  subnets      = var.public_subnet_ids
  enable_http2 = true

  tags = {
    Environment = var.environment
    Terraform   = "True"
    Domain      = local.app_domain
  }
}

// for application which is hosted in EC2 we mostly need one target groupe with type instance
resource "aws_lb_listener" "alb_listner_https" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.cert_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}


resource "aws_lb_listener" "alb_listner_http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}

// for application which is hosted in EC2 we mostly need one target groupe with type instance
resource "aws_lb_target_group" "alb_target_group" {
  name     = local.app_env
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  stickiness {
    type    = "lb_cookie"
    enabled = false
  }

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 6
    timeout             = 5
    interval            = 30
    path                = "/"
    port                = "traffic-port"
    matcher             = "200-499"
  }

  tags = {
    Environment = var.environment
    Terraform   = "True"
    Application = local.app_env
  }
}

resource "aws_lb_target_group_attachment" "alb_target_group" {
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = aws_instance.crs_adapter.id
  port             = 80
}

# Route53 Configuration for basic CNAME Record
resource "aws_route53_record" "cname_route53_record" {
  zone_id = var.route53_zone_id
  name    = local.app_domain
  type    = "CNAME"
  ttl     = "300"
  records = [aws_lb.alb.dns_name]
}