resource "random_string" "lc_cfg_suffix" {
  length  = 5
  special = false
  upper   = true
  lower   = false
}

# ASG Lunch Configuration config
resource "aws_launch_configuration" "launch_cfg" {
  name                        = local.lc_suffix
  image_id                    = var.ami_id
  instance_type               = var.instance_type
  security_groups             = var.security_group_ids_ec2
  key_name                    = var.key_name
  iam_instance_profile        = data.aws_iam_instance_profile.ec2_instance_profile.name
  associate_public_ip_address = false

  user_data                   = base64encode(
    templatefile("user_data.txt", {
      directoryId   = "d-123"
      directoryName = "steblynskyi.local"
      directoryOU   = "OU=${var.OU},OU=Servers - AWS,DC=steblynskyi,DC=local"
    })
  )

  root_block_device {
    volume_type           = "gp3"
    volume_size           = "100"
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

# ASG Config
resource "aws_autoscaling_group" "asg" {
  name                      = local.app_env
  launch_configuration      = aws_launch_configuration.launch_cfg.id
  health_check_grace_period = 300
  health_check_type         = "EC2"
  vpc_zone_identifier       = var.private_subnet_ids
  min_size                  = "1"
  max_size                  = "2"
  desired_capacity          = "1"

  target_group_arns = [aws_lb_target_group.alb_target_group.arn]

  tag {
    key                 = "Environment"
    value               = var.environment
    propagate_at_launch = true
  }
  tag {
    key                 = "Application"
    value               = local.app_env
    propagate_at_launch = true
  }
  tag {
    key                 = "Terraform"
    value               = var.tag_terraform
    propagate_at_launch = true
  }
  tag {
    key                 = "Domain"
    value               = local.app_domain
    propagate_at_launch = true
  }
  tag {
    key                 = "Name"
    value               = local.app_env
    propagate_at_launch = true
  }
}

# Adding dynamic scaling policy based on CloudWatch metric alert
resource "aws_autoscaling_policy" "AddCapacity" {
  name                   = "AddCapacity-${local.app_env}"
  autoscaling_group_name = aws_autoscaling_group.asg.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = 1
  cooldown               = 600
}

resource "aws_autoscaling_policy" "RemoveCapacity" {
  name                   = "RemoveCapacity-${local.app_env}"
  autoscaling_group_name = aws_autoscaling_group.asg.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = -1
  cooldown               = 600
}

resource "aws_cloudwatch_metric_alarm" "HighUtilization" {
  alarm_name          = "HighUtilization-${local.app_env}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  statistic           = "Average"
  period              = 300
  threshold           = 70

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg.name
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.AddCapacity.arn]
}

resource "aws_cloudwatch_metric_alarm" "LowUtilization" {
  alarm_name          = "LowUtilization-${local.app_env}"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 4
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  statistic           = "Average"
  period              = 600
  threshold           = 30

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg.name
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.RemoveCapacity.arn]
}

# Creating ALB
resource "aws_lb" "alb" {
  name     = local.app_env
  internal = true

  load_balancer_type = "application"
  security_groups    = var.security_group_ids_alb

  subnets      = var.private_subnet_ids
  enable_http2 = true

  tags = {
    Environment = var.environment
    Terraform   = var.tag_terraform
    Domain      = local.app_domain
  }
}

resource "aws_lb_listener" "alb_listner_https" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
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
    // if you dont want to do redirect change type to forward and add target groups
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
}

// for application which is hosted in EC2 we mostly need one target groupe with type instance
resource "aws_lb_target_group" "alb_target_group" {
  name                 = local.app_env
  port                 = 80
  protocol             = "HTTP"
  vpc_id               = var.vpc_id
  deregistration_delay = 60

  stickiness {
    type    = "lb_cookie"
    enabled = false
  }

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 10
    timeout             = 5
    interval            = 10
    path                = "/"
    port                = "traffic-port"
    matcher             = "200-499"
  }

  tags = {
    Environment = var.environment
    Terraform   = var.tag_terraform
    Application = local.app_env
  }

}

# Create codedeploy deployment group
resource "aws_codedeploy_deployment_group" "codedeploy" {
  app_name              = var.codedeploy_app_name
  deployment_group_name = local.app_env
  service_role_arn      = var.iam_role_codedeploy
  autoscaling_groups    = [aws_autoscaling_group.asg.name]

  deployment_config_name = "CodeDeployDefault.OneAtATime" # AWS defined deployment config

  load_balancer_info {
    target_group_info {
      name = local.app_env
    }
  }

  # trigger a rollback on deployment failure event
  auto_rollback_configuration {
    enabled = true

    events = [
      "DEPLOYMENT_FAILURE",
    ]
  }
}

# Route53 Configuration for basic CNAME Record
resource "aws_route53_record" "cname_route53_record" {
  zone_id = var.route53_zone_id
  name    = local.app_domain
  type    = "CNAME"
  ttl     = "300"
  records = [aws_lb.alb.dns_name]
}