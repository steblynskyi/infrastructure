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
  default     = "QA-to-Mgmt"
}

variable "description" {
  description = "Environment name"
  default     = "VPC peering to access QA VPC"
}

variable "tag_terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

variable "us_access_vpc_id" {
  description = "Mgmt VPC Id"
  default     = "vpc-123"
}

variable "us_access_cidr_block" {
  description = "Mgmt VPC CIDR Block"
  default     = "10.90.0.0/16"
}

variable "us_access_vpc_route_id" {
  description = "Mgmt VPC Route Id"
  default     = "rtb-0410f376acab8b453"
}

# QA VPC informations for peering
variable "qa_vpc_cidr_block" {
  description = "QA VPC CIDR Block"
  default     = "10.30.0.0/16"
}

variable "qa_vpc_id" {
  description = "QA VPC Id"
  default     = "vpc-123"
}

variable "qa_vpc_route_id" {
  description = "QA VPC Route Id"
  default     = "rtb-9118bcee"
}

variable "qa_vpc_route_kube_a_id" {
  description = "QA VPC route id for kube zone a"
  default     = "rtb-01154be026d1fb98d"
}

variable "qa_vpc_route_kube_b_id" {
  description = "QA VPC route id for kube zone b"
  default     = "rtb-0d5a99e81df9f5430"
}