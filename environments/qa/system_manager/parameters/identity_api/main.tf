resource "aws_ssm_parameter" "keyA" {
  name        = "/DEV/steblynskyi.Identity.Api/DataProtection/key-1-2-3-4"
  description = var.description-a
  type        = "SecureString"
  key_id      = "arn:aws:kms:us-east-1:123:key/1-2-3-4"
  value       = file("key-a.xml")
  tags = {
    "Environment" : var.environment
    "Terraform" : var.tag_terraform
  }
}

resource "aws_ssm_parameter" "keyB" {
  name        = "/DEV/steblynskyi.Identity.Api/DataProtection/key-1-2-3-4"
  description = var.description-b
  type        = "SecureString"
  key_id      = "arn:aws:kms:us-east-1:123:key/1-2-3-4"
  value       = file("key-b.xml")
  tags = {
    "Environment" : var.environment
    "Terraform" : var.tag_terraform
  }
}