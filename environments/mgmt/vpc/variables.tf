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

variable "name" {
  description = "Name of VPC"
  default     = "Mgmt-VPC"
}

variable "cidr" {
  description = "VPC IP address range, 65,534 usable ip"
  default     = "10.90.0.0/16"
}

variable "azs" {
  type        = list(string)
  description = "Availibility zone"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnets"
  default     = ["10.90.1.0/24", "10.90.2.0/24", "10.90.3.0/24"]
}

variable "subnet_private" {
  description = "Subnet Tag"
  default     = "Private"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnets"
  default     = ["10.90.10.0/24", "10.90.11.0/24", "10.90.12.0/24"]
}

variable "subnet_public" {
  description = "Subnet Tag"
  default     = "Public"
}

variable "enable_nat_gateway" {
  description = "Create NAT Gateway"
  default     = true
}

variable "single_nat_gateway" {
  description = "Create single NAT Gateway for VPC"
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Should be true if you want to use private DNS within the VPC"
  default     = true
}

variable "propagate_private_route_tables_vgw" {
  description = "Create single NAT Gateway for VPC"
  default     = true
}

variable "propagate_public_route_tables_vgw" {
  description = "Create single NAT Gateway for VPC"
  default     = true
}

variable "tag_terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}