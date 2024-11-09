variable "region" {
  description = "Which region envirment will be created"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile name on local machine for multi aws account use"
  default     = "taras"
}

variable "username" {
  description = "Desired name for the IAM user"
  default     = "utils-confidant-keeper-prod"
}

variable "system_path" {
  description = "Desired path for the IAM user"
  default     = "/"
}