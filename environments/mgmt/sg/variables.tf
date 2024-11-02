variable "environment" {
  description = "Environment name"
  default     = "Mgmt"
}

variable "region" {
  description = "Which region environment will be created"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile name on local machine for multi aws account use"
  default     = "taras"
}

variable "vpc_id" {
  default = "vpc-123"
}

variable "tag_terraform" {
  default = "True"
}

variable "description" {
  default = "Security group to allow access to DevOps via SSH, RDP etc.."
}