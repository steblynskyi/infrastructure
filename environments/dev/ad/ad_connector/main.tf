# MS AD Connector configuration
resource "aws_directory_service_directory" "connector" {
  name     = var.dir_domain_name
  password = var.password
  size     = var.size
  type     = var.dir_type

  description = var.description
  connect_settings {
    customer_username = var.customer_username
    customer_dns_ips  = var.customer_dns_ips
    vpc_id            = var.vpc_id
    subnet_ids        = var.private_subnet_ids
  }
}