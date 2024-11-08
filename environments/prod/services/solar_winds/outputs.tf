output "EC2" {
  value = aws_instance.solarwinds.*.id
}

output "Domain" {
  value = aws_route53_record.cname_route53_record.name
}