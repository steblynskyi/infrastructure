output "cluster_internal_domain" {
  description = "Route53 CNAME record to access ES cluster internally"
  value = aws_route53_record.cname_route53_record.name
}

output "es_endpoint" {
  description = "Domain-specific endpoint used to submit index, search, and data upload requests."
  value       = aws_elasticsearch_domain.audit_es.endpoint
}

output "kibana_endpoint" {
  description = "Domain-specific endpoint for kibana without https scheme."
  value       = aws_elasticsearch_domain.audit_es.kibana_endpoint
}

output "cluster_arn" {
  description = "ARN of the domain"
  value       = aws_elasticsearch_domain.audit_es.arn
}
