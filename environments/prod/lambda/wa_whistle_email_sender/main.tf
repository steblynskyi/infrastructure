# Create Lambda Function
resource "aws_lambda_function" "this" {
  filename         = var.zip_filename
  function_name    = var.function_name
  role             = var.iam_role
  handler          = var.message_handler
  runtime          = var.runtime_version
  memory_size      = var.memory_size
  publish          = "false"
  timeout          = "600"
  source_code_hash = filebase64sha256("wa-whistle-email-sender.zip")

  vpc_config {
    security_group_ids = [var.security_group_id]
    subnet_ids         = [var.subnet_a, var.subnet_b, var.subnet_c]
  }

  environment {
    variables = {
      ENV = "PROD"
    }
  }

  tags = {
    Terraform   = var.tag_terraform
    VPC         = var.vpc_id
    Environment = var.environment
  }
}

resource "aws_cloudwatch_event_rule" "this" {
  name                = "WA-Whistle-Every-30-Minutes"
  description         = "Fires every 30 minutes"
  schedule_expression = "rate(30 minutes)"
}

resource "aws_cloudwatch_event_target" "this" {
  arn       = aws_lambda_function.this.arn
  rule      = aws_cloudwatch_event_rule.this.name
  target_id = "wa-whistle-email-sender-prod"
}

# Trigger CloudWatch to Lambda Function
resource "aws_lambda_permission" "this" {
  statement_id  = var.statement_id
  action        = var.action
  function_name = aws_lambda_function.this.function_name
  principal     = var.principal
  source_arn    = aws_cloudwatch_event_rule.this.arn
}