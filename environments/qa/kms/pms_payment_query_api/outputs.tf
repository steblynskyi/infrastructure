output "KMS-Name" {
  value = aws_kms_alias.this.name
}

output "KMS-Key-ID" {
  value = aws_kms_key.this.key_id
}
output "KMS-ARN" {
  value = aws_kms_key.this.arn
}