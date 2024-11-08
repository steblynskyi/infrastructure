# Create VPC Flow Logs
resource "aws_flow_log" "vpc_flow_log" {
  vpc_id                   = var.vpc_id
  iam_role_arn             = aws_iam_role.vpc_flow_log_role.arn
  log_destination          = aws_cloudwatch_log_group.vpc_flow_log_group.arn
  log_destination_type     = "cloud-watch-logs"
  traffic_type             = "ALL"
  max_aggregation_interval = "600"

  tags = {
    Name        = var.flow_log_name
    Environment = var.environment
    Terraform   = var.terraform
  }

  depends_on = [
    aws_iam_role_policy.vpc_flow_log_policy,
    aws_iam_role.vpc_flow_log_role,
    aws_cloudwatch_log_group.vpc_flow_log_group,
  ]

}

# Create CloudWatch Log Group
resource "aws_cloudwatch_log_group" "vpc_flow_log_group" {
  name = var.flow_log_name

  tags = {
    Environment = var.environment
    Terraform   = var.terraform
  }
}

# Create IAM Role for CloudWatch
resource "aws_iam_role" "vpc_flow_log_role" {
  name               = var.flow_log_name
  assume_role_policy = file("assume-role-policy-cloudwatch.json")

  tags = {
    Environment = var.environment
    Terraform   = var.terraform
  }
}

# Attach Policy to IAM Role
resource "aws_iam_role_policy" "vpc_flow_log_policy" {
  name   = "cloudwatch-access"
  role   = aws_iam_role.vpc_flow_log_role.id
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