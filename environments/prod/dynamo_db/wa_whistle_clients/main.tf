# DynamoDB Main Configuration
resource "aws_dynamodb_table" "this" {
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

  lifecycle {
    # Ignore the capacity changes to keep auto-scaling configuration
    ignore_changes = [read_capacity, write_capacity]
  }
}

resource "aws_appautoscaling_target" "dynamodb_table_read_target" {
  depends_on         = [aws_dynamodb_table.this]
  max_capacity       = 40000
  min_capacity       = 5
  resource_id        = "table/${aws_dynamodb_table.this.name}"
  scalable_dimension = "dynamodb:table:ReadCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_target" "dynamodb_table_write_target" {
  depends_on         = [aws_dynamodb_table.this]
  max_capacity       = 40000
  min_capacity       = 5
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