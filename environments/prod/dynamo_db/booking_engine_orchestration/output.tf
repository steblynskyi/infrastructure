output "table_name" {
  value       = join("", aws_dynamodb_table.this[*].name)
  description = "DynamoDB table name"
}

output "table_id" {
  value       = join("", aws_dynamodb_table.this[*].id)
  description = "DynamoDB table ID"
}

output "table_arn" {
  value       = join("", aws_dynamodb_table.this[*].arn)
  description = "DynamoDB table ARN"
}

output "table_stream_arn" {
  value       = join("", aws_dynamodb_table.this[*].stream_arn)
  description = "DynamoDB table stream ARN"
}

output "table_stream_label" {
  value       = join("", aws_dynamodb_table.this[*].stream_label)
  description = "DynamoDB table stream label"
}