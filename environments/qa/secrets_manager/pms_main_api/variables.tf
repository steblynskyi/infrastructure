variable "region" {
  description = "Which region envirment will be created"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile name on local machine for multi aws account use"
  default     = "taras"
}

variable "secret" {
  description = "secret value"
  default     = "here"
}

variable "environment" {
  description = "Environment name"
  default     = "QA"
}

variable "tag_terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

variable "secret_name" {
  description = "Friendly name of the new secret"
  default     = "qa/steblynskyi/cipherKey"
}