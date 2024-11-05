output "access_key_status" {
  description = "Active or Inactive. Keys are initially active, but can be made inactive by other means."
  value       = module.taras_iam.access_key_status
}

output "access_key_id" {
  description = "The access key ID"
  value       = module.taras_iam.access_key_id
}

output "secret_access_key" {
  description = "The secret access key converted into an SES SMTP password"
  value       = module.taras_iam.secret_access_key
  sensitive   = true
}

output "user_arn" {
  description = "The ARN assigned by AWS for this user"
  value       = module.taras_iam.user_arn
}
