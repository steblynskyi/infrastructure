variable "region" {
  description = "Which region envirment will be created"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile name on local machine for multi aws account use"
  default     = "taras"
}

variable "environment" {
  description = "Environment name"
  default     = "PROD"
}

variable "application" {
  default = "security_group"
}

variable "vpc_id" {
  default = "vpc-123"
}