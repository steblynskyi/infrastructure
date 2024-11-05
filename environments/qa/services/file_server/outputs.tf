output "EC2" {
  description = "EC2 instance ID"
  value       = aws_instance.fileserver.id
}

output "Domain" {
  value = aws_route53_record.ec2_dns.name
}
