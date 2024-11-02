# Create new VPC
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.name
  cidr = var.cidr
  azs  = var.azs

  private_subnets = var.private_subnets
  private_subnet_tags = {
    Type                              = var.subnet_private
    "kubernetes.io/cluster/us-access" = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }

  public_subnets = var.public_subnets
  public_subnet_tags = {
    Type                              = var.subnet_public
    "kubernetes.io/cluster/us-access" = "shared"
    "kubernetes.io/role/elb"          = 1
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