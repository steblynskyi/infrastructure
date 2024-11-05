# ALB Config for Biztalk
resource "aws_lb" "alb" {
  name     = local.app_env
  internal = true

  load_balancer_type = "application"
  security_groups    = var.security_group_ids_alb
  idle_timeout       = "120"

  subnets      = var.private_subnet_ids
  enable_http2 = true

  tags = {
    Environment = var.environment
    Terraform   = var.tag_terraform
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
  name     = local.app_env
  port     = 8080
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
    Terraform   = var.tag_terraform
    Application = local.app_env
  }
}

resource "aws_lb_target_group_attachment" "alb_target_group" {
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = aws_instance.biztalk.id
  port             = 8080
}

# ALB Config for TripAdvisor
resource "aws_alb_target_group" "ota_public_api_tg" {
  name     = local.ota_public_api
  port     = local.ota_public_api_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    protocol            = "HTTP"
    path                = "/"
    port                = "traffic-port"
    healthy_threshold   = "5"
    unhealthy_threshold = "2"
    timeout             = "5"
    interval            = "30"
    matcher             = "200-499"
  }

  tags = {
    Terraform           = var.tag_terraform
    Environment         = var.environment
    propagate_at_launch = true
  }
}

# Http listner rule : PORT 80
resource "aws_alb_listener_rule" "ota_public_api_http_rule" {
  priority     = 100
  listener_arn = aws_lb_listener.alb_listner_http.arn

  action {
    type = "redirect"

    redirect {
      protocol    = "HTTPS"
      port        = "443"
      status_code = "HTTP_301"
    }
  }

  condition {
    host_header {
      values = ["tripadvisor-dc.qa-steblynskyi.com"]
    }
  }

  condition {
    path_pattern {
      values = ["/TripAdvisor_V7Book/TripAdvisorConnect.ashx/api_implementation/*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.ota_public_api_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "ota_public_api_https_rule" {
  priority     = 100
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.ota_public_api_tg.arn
  }

  condition {
    host_header {
      values = ["tripadvisor-dc.qa-steblynskyi.com"]
    }
  }

  condition {
    path_pattern {
      values = ["/TripAdvisor_V7Book/TripAdvisorConnect.ashx/api_implementation/*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.ota_public_api_tg]
}