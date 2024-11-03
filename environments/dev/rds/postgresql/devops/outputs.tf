output "DB-Host" {
  value = aws_db_instance.devops_db.address
}

output "DB-Engine" {
  value = aws_db_instance.devops_db.engine
}

output "DB-UserName" {
  value = aws_db_instance.devops_db.username
}

output "Domain" {
  value = aws_route53_record.cname_route53_record.name
}