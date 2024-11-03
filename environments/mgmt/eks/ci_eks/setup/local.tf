locals {
  aws_region      = var.aws_region
  aws_profile     = var.aws_profile
  environment     = var.environment
  main_domain     = var.main_domain
  cluster_name    = var.name
  cluster_version = var.cluster_version

  cluster_endpoint_public_access = var.cluster_endpoint_public_access
  vpc_id                         = var.vpc_id
  private_subnets                = [for subnet in data.aws_subnets.private_subnet_ids.ids : subnet]
  public_subnets                 = [for subnet in data.aws_subnets.public_subnet_ids.ids : subnet]
  additional_security_group_id   = var.additional_security_group_id

  tags = {
    Name        = var.name
    Environment = var.environment
    Terraform   = "True"
  }
}