output "Instance_Name" {
  description = "EC2 Instance Name"
  value       = aws_instance.controller.tags.Name
}

output "Instance_ID" {
  description = "EC2 instance ID"
  value       = aws_instance.controller.id
}

output "Domain_Name" {
  description = "Domain Name"
  value       = aws_route53_record.cname_route53_record.name
}