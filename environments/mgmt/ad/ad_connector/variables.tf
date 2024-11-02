variable "region" {
  description = "Which region envirment will be created"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile name on local machine for multi aws account use"
  default     = "taras"
}

variable "dir_domain_name" {
  default = "steblynskyi.local"
}

variable "vpc_id" {
  description = "Name of VPC"
  default     = "vpc-123"
}

variable "dir_type" {
  description = "Type of  MS AD"
  default     = "ADConnector"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnet"
  default     = ["subnet-123", "subnet-456"]
}

variable "customer_dns_ips" {
  type    = list(string)
  default = ["10.90.1.5", "10.90.2.5"]
}

variable "size" {
  default = "Small"
}

variable "description" {
  default = "MS AD Connector for Mnmgt env"
}

variable "customer_username" {
  default = "sync_ads"
}

variable "password" {
}