variable "region" {
  description = "Which region envirment will be created"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile name on local machine for multi aws account use"
  default     = "taras"
}

variable "domain_name" {
  default = "steblynskyi.prod"
}

variable "vpc_id" {
  description = "Name of VPC"
  default     = "vpc-123"
}

variable "dir_type" {
  description = "Type of  MS AD"
  default     = "MicrosoftAD"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnet"
  default     = ["subnet-1", "subnet-2"]
}

variable "size" {
  default = "Small"
}

variable "password" {
  description = "Default user is Admin"
  default     = "123"
}

variable "ad_edition" {
  description = "Edition of MS AD can be Standard or Enterprise"
  default     = "Standard"
}

variable "environment" {
  default = "PROD"
}

variable "tag_terraform" {
  default = "True"
}