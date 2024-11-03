variable "region" {
  description = "Which region environment will be created"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile name on local machine for multi aws account use"
  default     = "taras"
}

variable "environment" {
  description = "Environment name"
  default     = "DEV"
}

variable "s3_name" {
  description = "Default name of S3 bucket"
  default     = "steblynskyi-dev-prometheus-thanos-storage"
}

variable "acl" {
  description = "ACL Rules"
  default     = "private" # Can be change to: "public-read or private"
}