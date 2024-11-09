# EC2 Configuration
resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.ec2_private_subnet_id
  vpc_security_group_ids = var.security_group_ids_ec2
  iam_instance_profile   = data.aws_iam_instance_profile.ec2_instance_profile.name

  disable_api_termination = true

  root_block_device {
    volume_type           = "gp3"
    volume_size           = "150"
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
    Name        = local.app_env
    Environment = var.environment
    Terraform   = var.tag_terraform
    Application = local.app_env
  }
}

# ELB Config
resource "aws_elb" "elb" {
  name            = local.app_env
  subnets         = var.private_subnet_ids
  idle_timeout    = 120
  internal        = true
  security_groups = var.security_group_ids_elb

  listener {
    instance_port      = 8080
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = var.cert_arn
  }

  listener {
    instance_port     = 49187
    instance_protocol = "tcp"
    lb_port           = 49187
    lb_protocol       = "tcp"
  }

  health_check {
    target              = "TCP:8080"
    timeout             = 5
    interval            = 30
    unhealthy_threshold = 2
    healthy_threshold   = 10
  }

  instances                   = aws_instance.this.*.id
  cross_zone_load_balancing   = true
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Terraform           = var.tag_terraform
    Environment         = var.environment
    propagate_at_launch = true
    Name                = local.app_env
  }
}