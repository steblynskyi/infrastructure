variable "region" {
  description = "Which region environment will be created"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile name on local machine for multi aws account use"
  default     = "taras"
}

variable "tag_terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

variable "environment" {
  description = "Environment name"
  default     = "Mgmt"
}

# VPC ID for the EKS cluster
variable "vpc_id" {
  description = "The VPC ID for the EKS cluster"
  type        = string
  default     = "vpc-123"
}
