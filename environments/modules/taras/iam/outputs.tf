output "access_key_status" {
  description = "Active or Inactive. Keys are initially active, but can be made inactive by other means."
  value       = aws_iam_access_key.this.status
}

output "access_key_id" {
  description = "The access key ID"
  value       = aws_iam_access_key.this.id
}

output "secret_access_key" {
  description = "The secret access key converted into an SES SMTP password"
  value       = aws_iam_access_key.this.secret
  sensitive   = true
}

output "user_arn" {
  description = "The ARN assigned by AWS for this user"
  value       = aws_iam_user.this.arn
}