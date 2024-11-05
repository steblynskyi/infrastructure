# DynamoDB Main Configuration
resource "aws_dynamodb_table" "this" {
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
  attribute {
    name = var.attribute_name03
    type = var.attribute_type03
  }

  # DynamoDB Global Secondary Index Configuration
  global_secondary_index {
    name            = var.global_name
    hash_key        = var.global_hash_key
    read_capacity   = var.global_read_capacity
    write_capacity  = var.global_write_capacity
    projection_type = var.global_projection_type
  }

  tags = {
    Environment = var.environment
    Terraform   = var.tag_terraform
  }
}
