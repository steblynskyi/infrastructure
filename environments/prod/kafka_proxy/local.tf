locals {
  aws_region  = var.aws_region
  aws_profile = var.aws_profile
  environment = var.environment

  dns_zone_id = var.dns_zone_id
  main_domain = var.main_domain


  vpc_id          = var.vpc_id
  private_subnets = [for subnet in data.aws_subnets.private_subnet_ids.ids : subnet]
}