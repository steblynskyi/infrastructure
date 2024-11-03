data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_acm_certificate" "dev_steblynskyi_cert" {
  domain = var.main_domain
}

data "aws_route53_zone" "dev_steblynskyi_zone" {
  name = var.main_domain
}