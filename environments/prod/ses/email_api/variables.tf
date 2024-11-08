variable "region" {
  description = "Which region envirment will be created"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile name on local machine for multi aws account use"
  default     = "taras"
}

variable "vpc_id" {
  description = "PROD-VPC"
  default     = "vpc-123"
}

variable "tag_terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

variable "name" {
  description = "Name of SES"
  default     = "email-api-prod"
}

variable "sns_topic_arn" {
  description = "SNS Topic ARN"
  default     = "arn:aws:sns:us-east-1:123:Email-API-PROD"
}

variable "sns_event_type" {
  description = "Matching Type of SNS"
  default     = ["bounce", "click", "complaint", "delivery", "open", "reject", "renderingFailure", "send"]
}