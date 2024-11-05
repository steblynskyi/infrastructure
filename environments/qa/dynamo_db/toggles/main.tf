# DynamoDB Main Configuration
resource "aws_dynamodb_table" "toggles-qa" {
  name           = var.main_table_name
  read_capacity  = var.main_read_capacity
  write_capacity = var.main_write_capacity
  hash_key       = var.main_hash_key

  attribute {
    name = var.attribute_name01
    type = var.attribute_type01
  }

  tags = {
    Environment = var.environment
    Terraform   = var.tag_terraform
  }
}
