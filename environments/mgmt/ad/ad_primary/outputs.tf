output "Instance_Name" {
  description = "EC2 Instance Name"
  value       = aws_instance.this.tags.Name
}

output "Instance_ID" {
  description = "EC2 instance ID"
  value       = aws_instance.this.id
}