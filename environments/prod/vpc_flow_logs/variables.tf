variable "environment" {
  description = "Environment name"
  default     = "PROD"
}

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

variable "terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

variable "flow_log_name" {
  description = "CloudWatch VPC Flow Group"
  default     = "VPC-Flow"
}