# Create VPC Flow Logs
resource "aws_flow_log" "this" {
  vpc_id                   = var.vpc_id
  iam_role_arn             = aws_iam_role.this.arn
  log_destination          = aws_cloudwatch_log_group.this.arn
  log_destination_type     = "cloud-watch-logs"
  traffic_type             = "ALL"
  max_aggregation_interval = "600"

  tags = {
    Name        = var.flow_log_name
    Environment = var.environment
    Terraform   = var.terraform
  }
}

# Create CloudWatch Log Group
resource "aws_cloudwatch_log_group" "this" {
  name = var.flow_log_name
  retention_in_days = var.retention_in_days

  tags = {
    Environment = var.environment
    Terraform   = var.terraform
  }
}

# Create IAM Role for CloudWatch
resource "aws_iam_role" "this" {
  name               = var.flow_log_name
  assume_role_policy = file("assume-role-policy-cloudwatch.json")

  tags = {
    Environment = var.environment
    Terraform   = var.terraform
  }
}

# Attach Policy to IAM Role
resource "aws_iam_role_policy" "this" {
  name   = "cloudwatch-access"
  role   = aws_iam_role.this.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}