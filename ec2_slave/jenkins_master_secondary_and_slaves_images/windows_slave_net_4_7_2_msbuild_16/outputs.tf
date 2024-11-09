output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.jenkins_slave.id
}