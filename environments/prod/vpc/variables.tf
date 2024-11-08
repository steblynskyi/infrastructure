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
  default     = "PROD"
}

variable "name" {
  description = "Name of VPC"
  default     = "PROD-VPC"
}

variable "cidr" {
  description = "VPC IP address range, 65,534 usable ip"
  default     = "10.50.0.0/16"
}

variable "azs" {
  type        = list(string)
  description = "Availibility zone"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnets"
  default     = ["10.50.1.0/24", "10.50.2.0/24", "10.50.3.0/24"]
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnets"
  default     = ["10.50.10.0/24", "10.50.11.0/24", "10.50.12.0/24"]
}

variable "database_subnets" {
  type        = list(string)
  description = "List of database subnets"
  default     = ["10.50.16.0/24", "10.50.17.0/24"]
}

variable "elasticache_subnets" {
  type        = list(string)
  description = "List of subnet for elasticache"
  default     = ["10.50.18.0/25", "10.50.18.128/25", "10.50.19.0/25"]
}

variable "enable_nat_gateway" {
  description = "Create NAT Gateway"
  default     = true
}

variable "single_nat_gateway" {
  description = "Create single NAT Gateway for VPC"
  default     = false
}

variable "one_nat_gateway_per_az" {
  default = true
}

variable "enable_dns_hostnames" {
  description = "Should be true if you want to use private DNS within the VPC"
  default     = true
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  default     = true
}

variable "propagate_private_route_tables_vgw" {
  description = "Should be true if you want route table propagation"
  default     = true
}

variable "propagate_public_route_tables_vgw" {
  description = "Should be true if you want route table propagation"
  default     = true
}

variable "tag_terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

variable "s3_service_name" {
  description = "S3 Service name"
  default     = "com.amazonaws.us-east-1.s3"
}

variable "endpoint_type" {
  description = "VPC end point type"
  default     = "Gateway"
}