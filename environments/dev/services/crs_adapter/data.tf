# EC2 IAM instance profile (has been created by IAM template)
data "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_main_instance_profile"
}

# SSL Certificate
data "aws_acm_certificate" "dev_steblynskyi_cert" {
  domain = var.main_domain
}

# VPC Id
data "aws_vpc" "vpc" {
  id = var.vpc_id
}