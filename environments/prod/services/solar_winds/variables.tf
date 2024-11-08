variable "region" {
  description = "Which region envirment will be created"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile name on local machine for multi aws account use"
  default     = "taras"
}

variable "vpc_id" {
  default = "vpc-123"
}

variable "environment" {
  description = "Environment name"
  default     = "PROD"
}

variable "application" {
  description = "Name of application"
  default     = "SolarWinds-DB-Performance-Monitor"
}

variable "ami_id" {
  description = "AMI ID"
  default     = "ami-024c9ff85dc9dc154"
}

variable "instance_type" {
  default = "m4.large"
}

# SG for ec2 instances
variable "security_group_ids_ec2" {
  type    = list(string)
  default = ["sg-2", "sg-2", "sg-3"]
}

# Subnet id for EC2
variable "ec2_private_subnet_id" {
  description = "EC2 public subnet id"
  default     = "sg-1"
}

variable "tag_terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

variable "key_name" {
  description = "Pem key for EC2 Instance"
  default     = "linux-admin"
}

variable "route53_zone_id" {
  description = "Hosted Zone ID"
  default     = "here_zone_name"
}

variable "main_domain" {
  description = "Main domain name"
  default     = "steblynskyi.com"
}

variable "sub_domain" {
  description = "Subdomain for application"
  default     = "db-monitoring"
}

variable "OU" {
  default = "PROD Environment"
}