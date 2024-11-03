output "DB-Host" {
  value = aws_db_instance.quartz.address
}

output "DB-Engine" {
  value = aws_db_instance.quartz.engine
}

output "DB-UserName" {
  value = aws_db_instance.quartz.username
}

output "Domain" {
  value = aws_route53_record.cname_route53_record.name
}