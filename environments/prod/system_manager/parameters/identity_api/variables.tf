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

variable "tag_terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

variable "description-a" {
  description = "The description of the key as viewed in AWS console"
  default     = "key-here Key"
}

variable "description-b" {
  description = "The description of the key as viewed in AWS console"
  default     = "key-here Key"
}