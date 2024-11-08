locals {
  app_env    = "${var.application}-${var.environment}"
  app_domain = "${var.sub_domain}.${var.main_domain}"

  ota_public_api      = "${var.ota_public_api}-${var.environment}"
  ota_public_api_port = var.ota_public_api_port

  ec2_user_data = templatefile("${path.module}/user_data.txt", {
    directoryId   = "d-123"
    directoryName = "steblynskyi.prod"
    directoryOU   = "OU=Main,OU=${var.OU},OU=Servers - AWS,OU=steblynskyi,DC=steblynskyi,DC=prod"
  })
}