output "arn" {
  description = "AWS SecretManager Secret ARN"
  value       = aws_secretsmanager_secret.this.arn
}

output "id" {
  description = "AWS SecretManager Secret ID"
  value       = aws_secretsmanager_secret.this.id
}

output "secret" {
  description = "AWS SecretManager Secret resource"
  value       = aws_secretsmanager_secret.this
}

output "secret_version" {
  description = "AWS SecretManager Secret Version resource"
  value       = aws_secretsmanager_secret_version.this
  sensitive   = true
}