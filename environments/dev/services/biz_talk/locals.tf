locals {
  app_env                = "${var.application}-${var.environment}"
  app_domain             = "${var.sub_domain}.${var.main_domain}"
  app_domain_tripadvisor = "${var.sub_domain_tripadvisor}.${var.main_domain}"

  ota_public_api      = "${var.ota_public_api}-${var.environment}"
  ota_public_api_port = var.ota_public_api_port
}