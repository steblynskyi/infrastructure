// get private subnet ids by vpc id
data "aws_subnets" "private_subnet_ids" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  tags = {
    Type        = "Private"
    Environment = local.environment
  }
}

// get public subnet ids by vpc id
data "aws_subnets" "public_subnet_ids" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  tags = {
    Type        = "Public"
    Environment = local.environment
  }
}

data "aws_eks_cluster" "default" {
  name = local.cluster_name
}

data "aws_eks_cluster_auth" "default" {
  name = local.cluster_name
}

# Karpenter
data "aws_availability_zones" "available" {}
data "aws_ecrpublic_authorization_token" "token" {
}