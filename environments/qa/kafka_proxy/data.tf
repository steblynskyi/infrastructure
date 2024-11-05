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