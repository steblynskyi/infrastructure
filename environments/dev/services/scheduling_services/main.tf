resource "random_string" "lc_cfg_suffix" {
  length  = 6
  special = false
  upper   = true
  lower   = false
}

# Launch configuration and autoscaling group
resource "aws_launch_configuration" "scheduling_service" {
  name                 = local.lc_suffix
  image_id             = var.ami_id
  instance_type        = var.instance_type
  key_name             = var.key_name
  security_groups      = var.security_group_ids_ec2
  iam_instance_profile = data.aws_iam_instance_profile.ec2_instance_profile.name

  user_data = base64encode(
    templatefile("user_data.txt", {
      directoryId   = "d-123"
      directoryName = "steblynskyi.local"
      directoryOU   = "OU=${var.OU},OU=Servers - AWS,DC=steblynskyi,DC=local"
    })
  )

  # If server requred to additional EBS block
  ebs_block_device {
    device_name           = "/dev/sdb"
    volume_type           = "gp2"
    volume_size           = "50"
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "scheduling_service" {
  name                      = local.app_env
  min_size                  = 1
  desired_capacity          = 1
  max_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  force_delete              = true
  launch_configuration      = aws_launch_configuration.scheduling_service.name
  load_balancers            = [aws_elb.elb.name]
  vpc_zone_identifier       = var.private_subnet_ids

  tag {
    key                 = "Name"
    value               = local.app_env
    propagate_at_launch = true
  }

  tag {
    key                 = "Terraform"
    value               = var.tag_terraform
    propagate_at_launch = true
  }
}

resource "aws_elb" "elb" {
  name = local.app_env

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

  subnets         = var.private_subnet_ids
  idle_timeout    = 3600
  internal        = true
  security_groups = var.security_group_ids_elb

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