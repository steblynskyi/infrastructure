data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  value = data.aws_caller_identity.current.arn
}

output "caller_user" {
  value = data.aws_caller_identity.current.user_id
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnets" {
  value = [module.vpc.private_subnets]
}

output "public_subnets" {
  value = [module.vpc.public_subnets]
}

output "database_subnets" {
  value = [module.vpc.database_subnets]
}

output "elasticache_subnets" {
  value = [module.vpc.elasticache_subnets]
}

output "nat_public_ip" {
  value = [module.vpc.nat_public_ips]
}