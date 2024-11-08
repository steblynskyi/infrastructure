resource "aws_route53_zone" "this" {
  name = "dev-steblynskyi.com"

  tags = {
    Terraform = var.tag_terraform
    Environment = var.environment
  }
}

resource "aws_acm_certificate" "this" {
  domain_name               = "dev-steblynskyi.com"
  subject_alternative_names = ["*.dev-steblynskyi.com"]
  validation_method         = "DNS"

  tags = {
    Terraform = var.tag_terraform
    Environment = var.environment
  }
}

resource "aws_route53_record" "this" {
  for_each = {
    for dvo in aws_acm_certificate.this.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = aws_route53_zone.domain.id
}

resource "aws_acm_certificate_validation" "this" {
  certificate_arn         = aws_acm_certificate.this.arn
  validation_record_fqdns = [for record in aws_route53_record.this : record.fqdn]
}