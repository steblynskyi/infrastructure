
##################################################################
######## ALB listener rule and target group for Rates Api ########
resource "aws_alb_target_group" "inventory_api_tg" {
  name     = local.inventory_api
  port     = local.inventory_api_port
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
resource "aws_alb_listener_rule" "inventory_api_http_rule" {
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
    path_pattern {
      values = ["/inventory/api*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.inventory_api_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "inventory_api_https_rule" {
  priority     = 100
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.inventory_api_tg.arn
  }

  condition {
    path_pattern {
      values = ["/inventory/api*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.inventory_api_tg]
}

#################################################################
######## ALB listener rule and target group for Rates UI ########
resource "aws_alb_target_group" "rates_ui_tg" {
  name     = local.rates_ui
  port     = local.rates_ui_port
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
resource "aws_alb_listener_rule" "rates_ui_http_rule" {
  priority     = 110
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
    path_pattern {
      values = ["/inventory/*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.rates_ui_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "rates_ui_https_rule" {
  priority     = 110
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.rates_ui_tg.arn
  }

  condition {
    path_pattern {
      values = ["/inventory/*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.rates_ui_tg]
}

##################################################################
######## ALB listener rule and target group for Setup Google Booking Links########
resource "aws_alb_target_group" "setup_google_booking_links_tg" {
  name     = local.setup_google_booking_links
  port     = local.setup_google_booking_links_port
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
resource "aws_alb_listener_rule" "setup_google_booking_links_http_rule" {
  priority     = 151
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
    path_pattern {
      values = ["/setup/google-booking-links/*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.setup_google_booking_links_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "setup_google_booking_links_https_rule" {
  priority     = 151
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.setup_google_booking_links_tg.arn
  }

  condition {
    path_pattern {
      values = ["/setup/google-booking-links/*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.setup_google_booking_links_tg]
}


##################################################################
######## ALB listener rule and target group for Setup Light speed ########
resource "aws_alb_target_group" "setup_lightspeed_tg" {
  name     = local.setup_lightspeed
  port     = local.setup_lightspeed_port
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
resource "aws_alb_listener_rule" "setup_lightspeed_http_rule" {
  priority     = 152
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
    path_pattern {
      values = ["/setup/lightspeed*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.setup_lightspeed_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "setup_lightspeed_https_rule" {
  priority     = 152
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.setup_lightspeed_tg.arn
  }

  condition {
    path_pattern {
      values = ["/setup/lightspeed*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.setup_lightspeed_tg]
}

##################################################################
######## ALB listener rule and target group for center Web ########
resource "aws_alb_target_group" "center_web_tg" {
  name     = local.center_web
  port     = local.center_web_port
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
resource "aws_alb_listener_rule" "center_web_http_rule" {
  priority     = 153
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
    path_pattern {
      values = ["/pms/*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.center_web_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "center_web_https_rule" {
  priority     = 153
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.center_web_tg.arn
  }

  condition {
    path_pattern {
      values = ["/pms/*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.center_web_tg]
}

##################################################################
######## ALB listener rule and target group for Setup merchant services ########
resource "aws_alb_target_group" "setup_merchant_services_tg" {
  name     = local.setup_merchant_services
  port     = local.setup_merchant_services_port
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
resource "aws_alb_listener_rule" "setup_merchant_services_http_rule" {
  priority     = 154
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
    path_pattern {
      values = ["/setup/merchant-services/*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.setup_merchant_services_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "setup_merchant_services_https_rule" {
  priority     = 154
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.setup_merchant_services_tg.arn
  }

  condition {
    path_pattern {
      values = ["/setup/merchant-services/*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.setup_merchant_services_tg]
}

##################################################################
######## ALB listener rule and target group for Setup Web ########
resource "aws_alb_target_group" "setup_fields_configuration_tg" {
  name     = local.setup_fields_configuration
  port     = local.setup_fields_configuration_port
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
resource "aws_alb_listener_rule" "setup_fields_configuration_http_rule" {
  priority     = 155
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
    path_pattern {
      values = ["/setup/fields-configuration*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.setup_fields_configuration_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "setup_fields_configuration_https_rule" {
  priority     = 155
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.setup_fields_configuration_tg.arn
  }

  condition {
    path_pattern {
      values = ["/setup/fields-configuration*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.setup_fields_configuration_tg]
}


##################################################################
######## ALB listener rule and target group for Setup Web ########
resource "aws_alb_target_group" "setup_web_tg" {
  name     = local.setup_web
  port     = local.setup_web_port
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
resource "aws_alb_listener_rule" "setup_web_http_rule" {
  priority     = 156
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
    path_pattern {
      values = ["/setup*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.setup_web_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "setup_web_https_rule" {
  priority     = 156
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.setup_web_tg.arn
  }

  condition {
    path_pattern {
      values = ["/setup*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.setup_web_tg]
}



#########################################################################
######## ALB listener rule and target group for GuestServices UI ########
resource "aws_alb_target_group" "guestServices_ui_tg" {
  name     = local.guestServices_ui
  port     = local.guestServices_ui_port
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
resource "aws_alb_listener_rule" "guestServices_ui_http_rule" {
  priority     = 200
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
    path_pattern {
      values = ["/GuestServices*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.guestServices_ui_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "guestServices_ui_https_rule" {
  priority     = 200
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.guestServices_ui_tg.arn
  }

  condition {
    path_pattern {
      values = ["/GuestServices*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.guestServices_ui_tg]
}

##########################################################################
######## ALB listener rule and target group for Admin UI #################
resource "aws_alb_target_group" "admin_ui_tg" {
  name     = local.admin_ui
  port     = local.admin_ui_port
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
resource "aws_alb_listener_rule" "admin_ui_http_rule" {
  priority     = 210
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
    path_pattern {
      values = ["/admin*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.admin_ui_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "admin_ui_https_rule" {
  priority     = 210
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.admin_ui_tg.arn
  }

  condition {
    path_pattern {
      values = ["/admin*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.admin_ui_tg]
}

##########################################################################
######## ALB listener rule and target group for Admin Clients UI #################
resource "aws_alb_target_group" "admin_clients_ui_tg" {
  name     = local.admin_clients_ui
  port     = local.admin_clients_ui_port
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
resource "aws_alb_listener_rule" "admin_clients_ui_http_rule" {
  priority     = 209
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
    path_pattern {
      values = ["/admin/clients/*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.admin_clients_ui_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "admin_clients_ui_https_rule" {
  priority     = 209
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.admin_clients_ui_tg.arn
  }

  condition {
    path_pattern {
      values = ["/admin/clients/*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.admin_clients_ui_tg]
}

#######################################################################################
######## ALB listener rule and target group for Intergation Email WEB #################
resource "aws_alb_target_group" "integrations_email_web_tg" {
  name     = local.integrations_email_web
  port     = local.integrations_email_web_port
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
resource "aws_alb_listener_rule" "integrations_email_web_http_rule" {
  priority     = 208
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
    path_pattern {
      values = ["/admin/email-queue*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.integrations_email_web_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "integrations_email_web_https_rule" {
  priority     = 208
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.integrations_email_web_tg.arn
  }

  condition {
    path_pattern {
      values = ["/admin/email-queue*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.integrations_email_web_tg]
}

############################################################################
######## ALB listener rule and target group for Payment Reports Web ########
resource "aws_alb_target_group" "payment_reports_web_tg" {
  name     = local.payment_reports_web
  port     = local.payment_reports_web_port
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
resource "aws_alb_listener_rule" "payment_reports_web_http_rule" {
  priority     = 250
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
    path_pattern {
      values = ["/reports/payments*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.payment_reports_web_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "payment_reports_web_https_rule" {
  priority     = 250
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.payment_reports_web_tg.arn
  }

  condition {
    path_pattern {
      values = ["/reports/payments*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.payment_reports_web_tg]
}

############################################################################
######## ALB listener rule and target group for PMS Reports API #############
resource "aws_alb_target_group" "reports_api_tg" {
  name     = local.reports_api
  port     = local.reports_api_port
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
resource "aws_alb_listener_rule" "reports_api_http_rule" {
  priority     = 254
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
    path_pattern {
      values = ["/reports/api/*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.reports_api_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "reports_api_https_rule" {
  priority     = 254
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.reports_api_tg.arn
  }

  condition {
    path_pattern {
      values = ["/reports/api/*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.reports_api_tg]
}

############################################################################
######## ALB listener rule and target group for PMS Reports UI #############
resource "aws_alb_target_group" "reports_ui_tg" {
  name     = local.reports_ui
  port     = local.reports_ui_port
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
resource "aws_alb_listener_rule" "reports_ui_http_rule" {
  priority     = 255
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
    path_pattern {
      values = ["/reports/*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.reports_ui_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "reports_ui_https_rule" {
  priority     = 255
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.reports_ui_tg.arn
  }

  condition {
    path_pattern {
      values = ["/reports/*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.reports_ui_tg]
}

##################################################################
######## ALB listener rule and target group for Folio API ########
resource "aws_alb_target_group" "folio_api_tg" {
  name     = local.folio_api
  port     = local.folio_api_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    protocol            = "HTTP"
    path                = "/folio/api/status"
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
resource "aws_alb_listener_rule" "folio_api_http_rule" {
  priority     = 115
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
    path_pattern {
      values = ["/folio/api*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.folio_api_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "folio_api_https_rule" {
  priority     = 115
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.folio_api_tg.arn
  }

  condition {
    path_pattern {
      values = ["/folio/api*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.folio_api_tg]
}

#################################################################
######## ALB listener rule and target group for Taxes UI ########
resource "aws_alb_target_group" "taxes_ui_tg" {
  name     = local.taxes_ui
  port     = local.taxes_ui_port
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
resource "aws_alb_listener_rule" "taxes_ui_http_rule" {
  priority     = 120
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
    path_pattern {
      values = ["/setup/taxes*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.taxes_ui_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "taxes_ui_https_rule" {
  priority     = 120
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.taxes_ui_tg.arn
  }

  condition {
    path_pattern {
      values = ["/setup/taxes*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.taxes_ui_tg]
}

##################################################################
######## ALB listener rule and target group for Extensions Remote Lock Web ########
resource "aws_alb_target_group" "extensions_remote_lock_web_tg" {
  name     = local.extensions_remote_lock_web
  port     = local.extensions_remote_lock_web_port
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
resource "aws_alb_listener_rule" "extensions_remote_lock_web_http_rule" {
  priority     = 121
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
    path_pattern {
      values = ["/setup/remote-lock*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.extensions_remote_lock_web_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "extensions_remote_lock_web_https_rule" {
  priority     = 121
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.extensions_remote_lock_web_tg.arn
  }

  condition {
    path_pattern {
      values = ["/setup/remote-lock*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.extensions_remote_lock_web_tg]
}

#######################################################################################
######## ALB listener rule and target group for Extensions Templates Web ##############
resource "aws_alb_target_group" "extensions_templates_web_tg" {
  name     = local.extensions_templates_web
  port     = local.extensions_templates_web_port
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
resource "aws_alb_listener_rule" "extensions_templates_web_http_rule" {
  priority     = 122
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
    path_pattern {
      values = ["/setup/templates*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.extensions_templates_web_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "extensions_templates_web_https_rule" {
  priority     = 122
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.extensions_templates_web_tg.arn
  }

  condition {
    path_pattern {
      values = ["/setup/templates*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.extensions_templates_web_tg]
}

##########################################################################
######## ALB listener rule and target group for Innsights WEB API ########
resource "aws_alb_target_group" "innsights_web_api_tg" {
  name     = local.innsights_web_api
  port     = local.innsights_web_api_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    protocol            = "HTTP"
    path                = "/innsights/api/status"
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
resource "aws_alb_listener_rule" "innsights_web_api_http_rule" {
  priority     = 300
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
    path_pattern {
      values = ["/innsights/api/*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.innsights_web_api_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "innsights_web_api_https_rule" {
  priority     = 300
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.innsights_web_api_tg.arn
  }

  condition {
    path_pattern {
      values = ["/innsights/api/*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.innsights_web_api_tg]
}

#####################################################################
######## ALB listener rule and target group for Reservations UI ########
resource "aws_alb_target_group" "reservations_ui_tg" {
  name     = local.reservations_ui
  port     = local.reservations_ui_port
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
resource "aws_alb_listener_rule" "reservations_ui_http_rule" {
  priority     = 315
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
    path_pattern {
      values = ["/reservations/*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.reservations_ui_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "reservations_ui_https_rule" {
  priority     = 315
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.reservations_ui_tg.arn
  }

  condition {
    path_pattern {
      values = ["/reservations/*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.reservations_ui_tg]
}

###############################################################################
######## ALB listener rule and target group for Reservations Blocks UI ########
resource "aws_alb_target_group" "reservations_blocks_ui_tg" {
  name     = local.reservations_blocks_ui
  port     = local.reservations_blocks_ui_port
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
resource "aws_alb_listener_rule" "reservations_blocks_ui_http_rule" {
  priority     = 311
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
    path_pattern {
      values = ["/reservations/blocks*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.reservations_blocks_ui_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "reservations_blocks_ui_https_rule" {
  priority     = 311
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.reservations_blocks_ui_tg.arn
  }

  condition {
    path_pattern {
      values = ["/reservations/blocks*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.reservations_blocks_ui_tg]
}


#####################################################################
######## ALB listener rule and target group for Reservations API ########
resource "aws_alb_target_group" "reservations_api_tg" {
  name     = local.reservations_api
  port     = local.reservations_api_port
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
resource "aws_alb_listener_rule" "reservations_api_http_rule" {
  priority     = 310
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
    path_pattern {
      values = ["/reservations/api/*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.reservations_api_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "reservations_api_https_rule" {
  priority     = 310
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.reservations_api_tg.arn
  }

  condition {
    path_pattern {
      values = ["/reservations/api/*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.reservations_api_tg]
}

############################################################################
######## ALB listener rule and target group for QuickBooks Web ########
resource "aws_alb_target_group" "quickbooks_web_tg" {
  name     = local.quickbooks_web
  port     = local.quickbooks_web_port
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
resource "aws_alb_listener_rule" "quickbooks_web_http_rule" {
  priority     = 320
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
    path_pattern {
      values = ["/nightaudit/quickbooks*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.quickbooks_web_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "quickbooks_web_https_rule" {
  priority     = 320
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.quickbooks_web_tg.arn
  }

  condition {
    path_pattern {
      values = ["/nightaudit/quickbooks*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.quickbooks_web_tg]
}

############################################################################
######## ALB listener rule and target group for Messaging UI ########
resource "aws_alb_target_group" "messaging_ui_tg" {
  name     = local.messaging_ui
  port     = local.messaging_ui_port
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
resource "aws_alb_listener_rule" "messaging_ui_http_rule" {
  priority     = 325
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
    path_pattern {
      values = ["/messaging*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.messaging_ui_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "messaging_ui_https_rule" {
  priority     = 325
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.messaging_ui_tg.arn
  }

  condition {
    path_pattern {
      values = ["/messaging*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.messaging_ui_tg]
}

############################################################################
######## ALB listener rule and target group for Unit-Owners API ############
resource "aws_alb_target_group" "unit_owners_api_tg" {
  name     = local.unit_owners_api
  port     = local.unit_owners_api_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    protocol            = "HTTP"
    path                = "/unit-owners/health/live"
    port                = "traffic-port"
    healthy_threshold   = "5"
    unhealthy_threshold = "2"
    timeout             = "5"
    interval            = "30"
    matcher             = "200"
  }

  tags = {
    Terraform           = var.tag_terraform
    Environment         = var.environment
    propagate_at_launch = true
  }
}

# Http listner rule : PORT 80
resource "aws_alb_listener_rule" "unit_owners_api_http_rule" {
  priority     = 321
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
    path_pattern {
      values = ["/unit-owners/api/*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.unit_owners_api_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "unit_owners_api_https_rule" {
  priority     = 321
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.unit_owners_api_tg.arn
  }

  condition {
    path_pattern {
      values = ["/unit-owners/api/*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.unit_owners_api_tg]
}

############################################################################
######## ALB listener rule and target group for Identity Web ########
resource "aws_alb_target_group" "identity_web_tg" {
  name     = local.identity_web
  port     = local.identity_web_port
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
resource "aws_alb_listener_rule" "identity_web_http_rule" {
  priority     = 323
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
    path_pattern {
      values = ["/identity*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.identity_web_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "identity_web_https_rule" {
  priority     = 323
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.identity_web_tg.arn
  }

  condition {
    path_pattern {
      values = ["/identity*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.identity_web_tg]
}

############################################################################
######## ALB listener rule and target group for Messaging API ########
resource "aws_alb_target_group" "messaging_api_tg" {
  name     = local.messaging_api
  port     = local.messaging_api_port
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
resource "aws_alb_listener_rule" "messaging_api_http_rule" {
  priority     = 324
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
    path_pattern {
      values = ["/messaging/api/*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.messaging_api_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "messaging_api_https_rule" {
  priority     = 324
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.messaging_api_tg.arn
  }

  condition {
    path_pattern {
      values = ["/messaging/api/*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.messaging_api_tg]
}

#####################################################################
######## ALB listener rule and target group for Reservations CSP UI ########
resource "aws_alb_target_group" "reservations_csp_ui_tg" {
  name     = local.reservations_csp_ui
  port     = local.reservations_csp_ui_port
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
resource "aws_alb_listener_rule" "reservations_csp_ui_http_rule" {
  priority     = 101
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
    path_pattern {
      values = ["/reservations/*"]
    }
  }
  condition {
    host_header {
      values = ["csp.qa-steblynskyi.com"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.reservations_csp_ui_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "reservations_csp_ui_https_rule" {
  priority = 101

  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.reservations_csp_ui_tg.arn
  }

  condition {
    path_pattern {
      values = ["/reservations/*"]
    }
  }
  condition {
    host_header {
      values = ["csp.qa-steblynskyi.com"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.reservations_csp_ui_tg]
}

############################################################################
######## ALB listener rule and target group for Accounts UI ########
resource "aws_alb_target_group" "accounts_ui_tg" {
  name     = local.accounts_ui
  port     = local.accounts_ui_port
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
resource "aws_alb_listener_rule" "accounts_ui_http_rule" {
  priority     = 400
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
    path_pattern {
      values = ["/accounts/*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.accounts_ui_tg]
}

# Https listner rule : PORT 443
resource "aws_alb_listener_rule" "accounts_ui_https_rule" {
  priority     = 400
  listener_arn = aws_lb_listener.alb_listner_https.arn

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.accounts_ui_tg.arn
  }

  condition {
    path_pattern {
      values = ["/accounts/*"]
    }
  }

  depends_on = [aws_lb.alb, aws_alb_target_group.accounts_ui_tg]
}
