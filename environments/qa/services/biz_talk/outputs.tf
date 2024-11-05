output "ALB_Name" {
  value = aws_lb.alb.dns_name
}

output "Domain" {
  value = aws_route53_record.cname_route53_record.name
}

output "Domain_TripAdvisor" {
  value = aws_route53_record.cname_route53_record_tripadvisor.name
}