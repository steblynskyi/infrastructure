locals {
  app_domain = "${var.sub_domain}.${var.main_domain}"
  app_env    = "${var.application}-${var.environment}"
}