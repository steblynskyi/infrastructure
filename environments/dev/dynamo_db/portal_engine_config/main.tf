# DynamoDB Main Configuration
resource "aws_dynamodb_table" "this" {
  name           = var.table_name
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = var.hash_key
  range_key      = var.range_key

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
