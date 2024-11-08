output "DB-Host" {
  value = aws_db_instance.this.address
}

output "DB-Engine" {
  value = aws_db_instance.this.engine
}

output "DB-UserName" {
  value = aws_db_instance.this.username
}

output "Domain" {
  value = aws_route53_record.cname_route53_record.name
}
