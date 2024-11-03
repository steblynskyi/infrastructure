data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_acm_certificate" "mgmt_steblynskyi_cert" {
  domain = var.main_domain
}

data "aws_route53_zone" "mgmt_steblynskyi_zone" {
  name = var.main_domain
}

data "aws_sns_topic" "devops_sns_topic" {
  name = var.sns_topic
}
