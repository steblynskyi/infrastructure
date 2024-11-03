locals {
  app_env    = "${var.application}-${var.environment}"
  app_domain = "${var.sub_domain}.${var.main_domain}"
  lc_suffix  = "${var.application}-${var.environment}-${random_string.lc_cfg_suffix.result}"
}