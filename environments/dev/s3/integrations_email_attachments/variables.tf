variable "region" {
  description = "Which region envirment will be created"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile name on local machine for multi aws account use"
  default     = "taras"
}

variable "vpc_id" {
  description = "DEV-VPC"
  default     = "vpc-123"
}

variable "environment" {
  description = "Environment name"
  default     = "DEV"
}

variable "terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

variable "s3_name" {
  description = "Default name of S3 bucket"
  default     = "steblynskyi-dev-integrations-email-attachments"
}

variable "acl" {
  description = "ACL Rules"
  default     = "private" # Can be change to: "public-read or private"
}