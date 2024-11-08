output "DB-Host" {
  value = aws_db_instance.reservation.address
}

output "DB-Engine" {
  value = aws_db_instance.reservation.engine
}

output "DB-UserName" {
  value = aws_db_instance.reservation.username
}

output "Domain" {
  value = aws_route53_record.cname_route53_record.name
}