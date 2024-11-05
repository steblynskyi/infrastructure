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
  default     = "QA"
}

variable "application" {
  description = "Name of application"
  default     = "CRS-Adapter"
}

variable "ami_id" {
  description = "AMI ID"
  default     = "ami-0389f52cfc65cd790"
}

variable "instance_type" {
  default = "t2.small"
}

# SG for ALB/ELB
variable "security_group_ids_alb" {
  type    = list(string)
  default = ["sg-1"]
}

# SG for ec2 instances
variable "security_group_ids_ec2" {
  type    = list(string)
  default = ["sg-1", "sg-2"]
}

variable "ec2_private_subnet_id" {
  description = "EC2 private subnet"
  default     = "subnet-1"
}

# Private subnet to use on private resources
variable "private_subnet_ids" {
  description = "ALB of private subnets"
  type        = list(string)
  default     = ["subnet-1", "subnet-2"]
}

variable "tag_terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

# Public subnet need to use only in ALB/ELB if we need internat facing domain
variable "public_subnet_ids" {
  type        = list(string)
  description = "ALB of public subnets"
  default     = ["subnet-1", "subnet-2"]
}

variable "key_name" {
  description = "Pem key for EC2 Instance"
  default     = "windows-admin"
}

variable "health_check" {
  description = "Type of Health Check"
  default     = "EC2"
}

variable "route53_zone_id" {
  description = "Hosted Zone ID"
  default     = "Z1NDDDDDD6A15"
}

variable "main_domain" {
  description = "Main domain name"
  default     = "qa-steblynskyi.com"
}

variable "sub_domain" {
  description = "Subdomain for application"
  default     = "connect"
}

variable "OU" {
  default = "QA Environment"
}

variable "cert_arn" {
  default = "arn:aws:acm:us-east-1:123:certificate/1111-222-333-444-555"
}
