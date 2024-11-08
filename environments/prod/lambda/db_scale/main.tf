resource "aws_iam_role" "RDSDBScale_lambda_role" {
  name               = "RDSDBScale_lambda_role"
  assume_role_policy = data.aws_iam_policy_document.assume-role-policy.json
}

resource "aws_iam_policy" "lambda_access_aws_resource" {
  name   = "lambda_access_aws_resource"
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
  timeout          = "120"
  source_code_hash = filebase64sha256(var.filename)

  environment {
    variables = {
      TEAMS_WEBHOOK_URL = "https://steblynskyi.webhook.office.com/webhookb2/1727195f-f960-4ff4-9957-f8de65802931@111-222-333-444-111/IncomingWebhook/6666/000-ec4d-4a64-b365-333"
    }
  }

  tags = {
    Terraform = var.tag_terraform
  }

  depends_on = [aws_iam_role.RDSDBScale_lambda_role]
}

// schedule to scale down InnCenterDB
// =================================================
resource "aws_cloudwatch_event_rule" "innCenter-scaleDown" {
  name                = "InnCenterDBScaleDown"
  description         = "Scale down InnCenterDB by changing instance type"
  schedule_expression = "cron(0 2 * * ? *)"

  state               = "DISABLED"
}

resource "aws_cloudwatch_event_target" "trigger-scaleDown-innCenterDB" {
  arn  = aws_lambda_function.RDSDBScale.arn
  rule = aws_cloudwatch_event_rule.innCenter-scaleDown.name

  input = <<RInput
    {
      "event_type": "DB Scaling DOWN",
      "environment": "PROD",
      "instance_identifier": "inncenter-db-prod",
      "instance_class": "db.r5.4xlarge"
    }
  RInput

  depends_on = [aws_lambda_function.RDSDBScale]
}

resource "aws_lambda_permission" "allow_exec_lambda_from_innCenterDb_scaleDown" {
  action        = var.permission_action
  function_name = aws_lambda_function.RDSDBScale.function_name
  principal     = var.permission_principal
  source_arn    = aws_cloudwatch_event_rule.innCenter-scaleDown.arn
}

// schedule to scale UP InnCenterDB
// =================================================
resource "aws_cloudwatch_event_rule" "innCenter-scaleUp" {
  name                = "InnCenterDBScaleUp"
  description         = "Scale Up InnCenterDB by changing instance type"
  schedule_expression = "cron(0 9 * * ? *)"

  state               = "DISABLED"
}

resource "aws_cloudwatch_event_target" "trigger-scaleUp-innCenterDB" {
  arn  = aws_lambda_function.RDSDBScale.arn
  rule = aws_cloudwatch_event_rule.innCenter-scaleUp.name

  input = <<RInput
    {
      "event_type": "DB Scaling UP",
      "environment": "PROD",
      "instance_identifier": "inncenter-db-prod",
      "instance_class": "db.r5.8xlarge"
    }
  RInput

  depends_on = [aws_lambda_function.RDSDBScale]
}

resource "aws_lambda_permission" "allow_exec_lambda_from_innCenterDb_scaleUp" {
  action        = var.permission_action
  function_name = aws_lambda_function.RDSDBScale.function_name
  principal     = var.permission_principal
  source_arn    = aws_cloudwatch_event_rule.innCenter-scaleUp.arn
}


// schedule to scale down reservation-prod
// =================================================
resource "aws_cloudwatch_event_rule" "reservation-scaleDown" {
  name                = "ReservationDBScaleDown"
  description         = "Scale down Reservation by changing instance type"
  schedule_expression = "cron(0 2 * * ? *)"

  state               = "DISABLED"
}

resource "aws_cloudwatch_event_target" "trigger-scaleDown-reservation" {
  arn  = aws_lambda_function.RDSDBScale.arn
  rule = aws_cloudwatch_event_rule.reservation-scaleDown.name

  input = <<RInput
    {
      "event_type": "DB Scaling DOWN",
      "environment": "PROD",
      "instance_identifier": "reservation-prod",
      "instance_class": "db.t3.xlarge"
    }
  RInput

  depends_on = [aws_lambda_function.RDSDBScale]
}

resource "aws_lambda_permission" "allow_exec_lambda_from_reservation_scaleDown" {
  action        = var.permission_action
  function_name = aws_lambda_function.RDSDBScale.function_name
  principal     = var.permission_principal
  source_arn    = aws_cloudwatch_event_rule.reservation-scaleDown.arn
}

// schedule to scale UP reservation-prod
// =================================================
resource "aws_cloudwatch_event_rule" "reservation-scaleUp" {
  name                = "ReservationDBScaleUp"
  description         = "Scale Up ReservationDB by changing instance type"
  schedule_expression = "cron(0 9 * * ? *)"

  state               = "DISABLED"
}

resource "aws_cloudwatch_event_target" "trigger-scaleUp-reservation" {
  arn  = aws_lambda_function.RDSDBScale.arn
  rule = aws_cloudwatch_event_rule.reservation-scaleUp.name

  input = <<RInput
    {
      "event_type": "DB Scaling UP",
      "environment": "PROD",
      "instance_identifier": "reservation-prod",
      "instance_class": "db.t3.2xlarge"
    }
  RInput

  depends_on = [aws_lambda_function.RDSDBScale]
}

resource "aws_lambda_permission" "allow_exec_lambda_from_reservationDB_scaleUp" {
  action        = var.permission_action
  function_name = aws_lambda_function.RDSDBScale.function_name
  principal     = var.permission_principal
  source_arn    = aws_cloudwatch_event_rule.reservation-scaleUp.arn
}