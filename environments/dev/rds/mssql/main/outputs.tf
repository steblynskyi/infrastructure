output "DB-Host" {
  value = aws_db_instance.main.address
}

output "DB-Engine" {
  value = aws_db_instance.main.engine
}

output "DB-UserName" {
  value = aws_db_instance.main.username
}

output "Domain" {
  value = aws_route53_record.cname_route53_record.name
}