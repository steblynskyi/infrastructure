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

  lifecycle {

    # Ignore the capacity changes to keep auto-scaling configuration
    ignore_changes = [read_capacity, write_capacity]
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

resource "aws_appautoscaling_target" "dynamodb_table_read_target" {
  depends_on         = [aws_dynamodb_table.this]
  max_capacity       = 200
  min_capacity       = 30
  resource_id        = "table/${aws_dynamodb_table.this.name}"
  scalable_dimension = "dynamodb:table:ReadCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_target" "dynamodb_table_write_target" {
  depends_on         = [aws_dynamodb_table.this]
  max_capacity       = 1000
  min_capacity       = 20
  resource_id        = "table/${aws_dynamodb_table.this.name}"
  scalable_dimension = "dynamodb:table:WriteCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_policy" "dynamodb_table_read_policy" {
  depends_on         = [aws_dynamodb_table.this]
  name               = "DynamoDBReadCapacityUtilization:${aws_appautoscaling_target.dynamodb_table_read_target.resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.dynamodb_table_read_target.resource_id
  scalable_dimension = aws_appautoscaling_target.dynamodb_table_read_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.dynamodb_table_read_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBReadCapacityUtilization"
    }

    target_value = 75
  }
}

resource "aws_appautoscaling_policy" "dynamodb_table_write_policy" {
  depends_on         = [aws_dynamodb_table.this]
  name               = "DynamoDBWriteCapacityUtilization:${aws_appautoscaling_target.dynamodb_table_write_target.resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.dynamodb_table_write_target.resource_id
  scalable_dimension = aws_appautoscaling_target.dynamodb_table_write_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.dynamodb_table_write_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBWriteCapacityUtilization"
    }

    target_value = 75
  }
}