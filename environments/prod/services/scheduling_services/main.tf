# EC2 Configuration
resource "aws_instance" "scheduling_services" {
  count                   = 2
  ami                     = var.ami_id
  instance_type           = var.instance_type
  key_name                = var.key_name
  subnet_id               = var.ec2_private_subnet_id
  vpc_security_group_ids  = var.security_group_ids_ec2
  iam_instance_profile    = data.aws_iam_instance_profile.ec2_instance_profile.name
  user_data = base64encode(
    templatefile("user_data.txt", {
      directoryId   = "d-123"
      directoryName = "steblynskyi.prod"
      directoryOU   = "OU=${var.OU},OU=Servers - AWS,DC=steblynskyi,DC=prod"
    })
  )

  disable_api_termination = true

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "100"
    delete_on_termination = true
  }

  ebs_block_device {
    device_name           = "/dev/sdb"
    volume_type           = "gp2"
    volume_size           = "100"
    delete_on_termination = true
  }

  volume_tags = {
    Name        = local.app_env
    Environment = var.environment
    Terraform   = var.tag_terraform
  }

  lifecycle {
    create_before_destroy = true
  }

  associate_public_ip_address = false

  tags = {
    Environment = var.environment
    Terraform   = var.tag_terraform
    Name        = local.app_env
    Domain      = local.app_domain
  }
}

# ELB Config
resource "aws_elb" "elb" {
  name            = local.app_env
  subnets         = var.private_subnet_ids
  idle_timeout    = 3600
  internal        = true
  security_groups = var.security_group_ids_elb

  listener {
    instance_port     = 555
    instance_protocol = "tcp"
    lb_port           = 555
    lb_protocol       = "tcp"
  }

  health_check {
    target              = "TCP:555"
    timeout             = 5
    interval            = 30
    unhealthy_threshold = 2
    healthy_threshold   = 10
  }

  instances                   = aws_instance.scheduling_services.*.id
  cross_zone_load_balancing   = true
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Terraform           = var.tag_terraform
    Environment         = var.environment
    propagate_at_launch = true
    Domain              = local.app_domain
    Name                = local.app_env
  }
}

# Route53 Configuration for basic CNAME Record
resource "aws_route53_record" "cname_route53_record" {
  zone_id = var.route53_zone_id
  name    = local.app_domain
  type    = "CNAME"
  ttl     = "300"
  records = [aws_elb.elb.dns_name]
}