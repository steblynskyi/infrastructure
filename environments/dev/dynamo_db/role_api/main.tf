# DynamoDB Main Configuration
resource "aws_dynamodb_table" "role-api-dev" {
  name           = var.main_table_name
  read_capacity  = var.main_read_capacity
  write_capacity = var.main_write_capacity
  hash_key       = var.main_hash_key
  range_key      = var.main_range_key

  attribute {
    name = var.attribute_name01
    type = var.attribute_type01
  }
  attribute {
    name = var.attribute_name02
    type = var.attribute_type02
  }

  tags = {
    Environment = var.environment
    Terraform   = var.tag_terraform
  }
}
