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

  tags = {
    Environment = var.environment
    Terraform   = var.tag_terraform
  }
}

resource "aws_dynamodb_table_item" "notes-importer" {
  table_name = aws_dynamodb_table.this.name
  hash_key   = aws_dynamodb_table.this.hash_key
  range_key  = aws_dynamodb_table.this.range_key

  item = file("notes-importer.json")
}

resource "aws_dynamodb_table_item" "pms-housekeeping-event-handler-property-night-audit" {
  table_name = aws_dynamodb_table.this.name
  hash_key   = aws_dynamodb_table.this.hash_key
  range_key  = aws_dynamodb_table.this.range_key

  item = file("pms-housekeeping-event-handler-property-night-audit.json")
}

resource "aws_dynamodb_table_item" "pms-housekeeping-event-handler-reservation-checkedin" {
  table_name = aws_dynamodb_table.this.name
  hash_key   = aws_dynamodb_table.this.hash_key
  range_key  = aws_dynamodb_table.this.range_key

  item = file("pms-housekeeping-event-handler-reservation-checkedin.json")
}

resource "aws_dynamodb_table_item" "pms-task-initial-notes-importer" {
  table_name = aws_dynamodb_table.this.name
  hash_key   = aws_dynamodb_table.this.hash_key
  range_key  = aws_dynamodb_table.this.range_key

  item = file("pms-task-initial-notes-importer.json")
}

resource "aws_dynamodb_table_item" "pms-task-notes-importer" {
  table_name = aws_dynamodb_table.this.name
  hash_key   = aws_dynamodb_table.this.hash_key
  range_key  = aws_dynamodb_table.this.range_key

  item = file("pms-task-notes-importer.json")
}

resource "aws_dynamodb_table_item" "pms-task-scheduler" {
  table_name = aws_dynamodb_table.this.name
  hash_key   = aws_dynamodb_table.this.hash_key
  range_key  = aws_dynamodb_table.this.range_key

  item = file("pms-task-scheduler.json")
}

resource "aws_dynamodb_table_item" "stringtest" {
  table_name = aws_dynamodb_table.this.name
  hash_key   = aws_dynamodb_table.this.hash_key
  range_key  = aws_dynamodb_table.this.range_key

  item = file("stringtest.json")
}
