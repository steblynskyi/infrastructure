# Create new VPC
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name            = var.name
  cidr            = var.cidr
  azs             = var.azs
  private_subnets = var.private_subnets

  private_subnet_tags = {
    Type = var.subnet_private
  }

  public_subnets = var.public_subnets

  public_subnet_tags = {
    Type = var.subnet_public
  }

  database_subnets = var.database_subnets

  database_subnet_tags = {
    Type = var.db_subnet
  }

  elasticache_subnets = var.elasticache_subnets

  elasticache_subnet_tags = {
    Description = var.elasticache_subnets_desc
    Name        = var.elasticache_name
  }

  enable_nat_gateway                 = var.enable_nat_gateway
  single_nat_gateway                 = var.single_nat_gateway
  enable_dns_hostnames               = var.enable_dns_hostnames
  propagate_private_route_tables_vgw = var.propagate_private_route_tables_vgw
  propagate_public_route_tables_vgw  = var.propagate_public_route_tables_vgw

  enable_vpn_gateway = false

  tags = {
    Terraform   = var.tag_terraform
    Environment = var.environment
  }
}

resource "aws_vpc_endpoint" "s3_endpoint" {
 vpc_id             = module.vpc.vpc_id
 service_name       = var.s3_service_name
 vpc_endpoint_type  = var.endpoint_type
 route_table_ids    = var.route_table_ids

 tags = {
    Environment     = var.environment
    Terraform       = var.tag_terraform
 }
}
