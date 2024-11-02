locals {
  app_env    = "${var.application}-${var.environment}"
  app_domain_int = "${var.sub_domain_int}.${var.main_domain}"
  app_domain_ext = "${var.sub_domain_ext}.${var.main_domain}"
}
