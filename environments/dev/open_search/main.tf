resource "aws_elasticsearch_domain" "opensearch" {
  domain_name           = var.domain_name
  elasticsearch_version = var.es_version

  cluster_config {
    instance_type  = var.es_instance_type
    instance_count = var.instance_count
    dedicated_master_enabled = var.dedicated_master_enabled
    dedicated_master_count   = var.dedicated_master_count
    dedicated_master_type    = var.dedicated_master_type
    zone_awareness_enabled   = var.zone_awareness_enabled
  }

  ebs_options {
    ebs_enabled = true
    volume_size = var.ebs_volume_size
    volume_type = "gp3"
  }

  domain_endpoint_options {
    custom_endpoint_enabled         = true
    custom_endpoint                 = local.app_domain
    custom_endpoint_certificate_arn = data.aws_acm_certificate.devinnroad_cert.arn
    tls_security_policy             = "Policy-Min-TLS-1-2-2019-07"
  }

  vpc_options {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_groups_ids
  }

  advanced_options = {
    "rest.action.multi.allow_explicit_index" = "true"
  }

  access_policies = <<CONFIG
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "es:*",
            "Principal": "*",
            "Effect": "Allow",
            "Resource": "arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/${var.domain_name}/*"
        }
    ]
}
CONFIG

  tags = {
    Domain      = var.domain_name
    Terraform   = true
    Environment = var.environment
  }
}

resource "aws_route53_record" "cname_route53_record" {
  zone_id    = data.aws_route53_zone.devinnroad_zone.zone_id
  name       = local.app_domain
  type       = "CNAME"
  ttl        = "300"
  records    = [aws_elasticsearch_domain.opensearch.endpoint]
  depends_on = [aws_elasticsearch_domain.opensearch]
}