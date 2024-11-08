module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.15.0"

  name = var.name
  cidr = var.cidr
  azs  = var.azs

  private_subnets = var.private_subnets
  private_subnet_tags = {
    Type                                         = "Private"
    SubnetType                                   = "Private"
    "kubernetes.io/cluster/kube.steblynskyi.com" = "shared"
    "kubernetes.io/role/internal-elb"            = "1"

  }

  public_subnets = var.public_subnets
  public_subnet_tags = {
    Type                                         = "Public"
    SubnetType                                   = "Utility"
    "kubernetes.io/cluster/kube.steblynskyi.com" = "shared"
    "kubernetes.io/role/elb"                     = "1"
  }

  database_subnets = var.database_subnets
  database_subnet_tags = {
    Type = "Private DB Subnet"
  }

  elasticache_subnets = var.elasticache_subnets
  elasticache_subnet_tags = {
    Type = "Private Elasticache Subnet"
  }

  enable_nat_gateway                 = var.enable_nat_gateway
  single_nat_gateway                 = var.single_nat_gateway
  one_nat_gateway_per_az             = var.one_nat_gateway_per_az
  enable_dns_hostnames               = var.enable_dns_hostnames
  enable_dns_support                 = var.enable_dns_support
  propagate_private_route_tables_vgw = var.propagate_private_route_tables_vgw
  propagate_public_route_tables_vgw  = var.propagate_public_route_tables_vgw
  enable_vpn_gateway                 = true
  dhcp_options_domain_name           = "ec2.internal"
  dhcp_options_domain_name_servers   = ["AmazonProvidedDNS", "10.50.1.194", "10.50.2.23", ]
  dhcp_options_tags = {
    Name = "ec2.internal"
  }
  tags = {
    Terraform   = var.tag_terraform
    Environment = var.environment
  }
}

resource "aws_vpc_endpoint" "s3_endpoint" {
  service_name      = var.s3_service_name
  vpc_id            = module.vpc.vpc_id
  vpc_endpoint_type = var.endpoint_type
  route_table_ids   = [module.vpc.private_route_table_ids[0], module.vpc.private_route_table_ids[1], module.vpc.private_route_table_ids[2]]
  tags = {
    Name        = "s3-endpoint"
    Environment = var.environment
    Terraform   = var.tag_terraform
  }
}