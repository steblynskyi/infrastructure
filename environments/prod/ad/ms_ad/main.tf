# MS AD Connector configuration
resource "aws_directory_service_directory" "this" {
  name     = var.domain_name
  password = var.password
  size     = var.size
  type     = var.dir_type
  edition  = var.ad_edition

  vpc_settings {
    vpc_id     = var.vpc_id
    subnet_ids = var.private_subnet_ids
  }

  tags = {
    Terraform   = var.tag_terraform
    Environment = var.environment
  }
}
