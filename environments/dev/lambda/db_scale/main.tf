resource "aws_iam_role" "RDSDBScale_lambda_role" {
  name               = "RDSDBScale_lambda_role"
  assume_role_policy = data.aws_iam_policy_document.assume-role-policy.json
}

resource "aws_iam_policy" "lambda_access_aws_resource" {
  name   = "s3_codedeploy_policy"
  policy = file("role-policy.json")
}

# Attach custom policy to role
resource "aws_iam_role_policy_attachment" "attache_to_role" {
  role       = aws_iam_role.RDSDBScale_lambda_role.name
  policy_arn = aws_iam_policy.lambda_access_aws_resource.arn
  depends_on = [aws_iam_role.RDSDBScale_lambda_role]
}

// Only create this func one time, use cloudwatch even rule to send diff type of instance
resource "aws_lambda_function" "RDSDBScale" {
  function_name    = var.function_name
  handler          = var.handler
  role             = aws_iam_role.RDSDBScale_lambda_role.arn
  runtime          = var.runtime
  filename         = var.filename
  memory_size      = var.memory_size
  publish          = "false"
  timeout          = "60"
  source_code_hash = filebase64sha256(var.filename)

  environment {
    variables = {
      TEAMS_WEBHOOK_URL = "https://steblynskyi.webhook.office.com/webhookb2/22222-222-4ff4-9957-22222@5071755d-3d25-4950-82d2-22222/IncomingWebhook/2222222/50dac9df-ec4d-4a64-b365-222222"
    }
  }

  tags = {
    Terraform = var.tag_terraform
  }

  depends_on = [aws_iam_role.RDSDBScale_lambda_role]
}

// schedule to scale down
resource "aws_cloudwatch_event_rule" "guest-dev-scaleDown" {
  name                = "GuestdevScaleDown"
  description         = "Scale down RDS Guest DB in dev env"
  schedule_expression = "cron(20 20 * * ? *)"

  state               = "DISABLED"
}

resource "aws_cloudwatch_event_target" "trigger-scaleDown-guestdev" {
  arn  = aws_lambda_function.RDSDBScale.arn
  rule = aws_cloudwatch_event_rule.guest-dev-scaleDown.name

  input = <<RInput
    {
      "event_type": "DB Scaling UP",
      "environment": "dev",
      "instance_identifier": "guest-dev",
      "instance_class": "db.t3.small"
    }
  RInput

  depends_on = [aws_lambda_function.RDSDBScale]
}

resource "aws_lambda_permission" "allow_exec_lambda_from_guest-dev-scaleDown" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.RDSDBScale.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.guest-dev-scaleDown.arn
}