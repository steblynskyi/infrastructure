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
  default     = "Mgmt"
}

variable "name" {
  description = "Environment name"
  default     = "DEV-to-Mgmt"
}

variable "description" {
  description = "Environment name"
  default     = "VPC peering to access DEV VPC"
}

variable "tag_terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

variable "mgmt_vpc_id" {
  description = "Mgmt VPC Id"
  default     = "vpc-123"
}

variable "mgmt_cidr_block" {
  description = "Mgmt VPC CIDR Block"
  default     = "10.90.0.0/16"
}

variable "mgmt_vpc_route_id" {
  description = "Mgmt VPC Route Id"
  default     = "rtb-0410f376acab8b453"
}

# DEV VPC informations for peering
variable "dev_vpc_cidr_block" {
  description = "Dev VPC CIDR Block"
  default     = "10.10.0.0/16"
}

variable "dev_vpc_id" {
  description = "Dev VPC Id"
  default     = "vpc-123"
}

variable "dev_vpc_route_id" {
  description = "Dev VPC Route Id"
  default     = "rtb-037e3b4aea3b85b34"
}

variable "dev_vpc_route_kube_a_id" {
  description = "DEV VPC route id for kube zone a"
  default     = "rtb-0ec0bda277b50a2df"
}

variable "dev_vpc_route_kube_b_id" {
  description = "DEV VPC route id for kube zone b"
  default     = "rtb-0ae8a81e358f41135"
}