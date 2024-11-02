locals {
  app_env    = "${var.application}-${var.environment}"
  app_domain = "${var.sub_domain}.${var.main_domain}"
}