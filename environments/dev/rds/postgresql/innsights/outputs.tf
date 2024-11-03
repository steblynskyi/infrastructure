output "DB-Host" {
  value = aws_db_instance.innsights.address
}

output "DB-Engine" {
  value = aws_db_instance.innsights.engine
}

output "DB-UserName" {
  value = aws_db_instance.innsights.username
}

output "Domain" {
  value = aws_route53_record.cname_route53_record.name
}