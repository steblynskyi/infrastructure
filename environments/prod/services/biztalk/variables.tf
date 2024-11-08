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
  default     = "Biztalk"
}

variable "ami_id" {
  description = "AMI ID"
  default     = "ami-00360458a879ed9a6"
}

variable "instance_type" {
  default = "m5.xlarge"
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

variable "tag_terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

# Private subnet to use on private resources
variable "private_subnets_ids" {
  description = "ALB of private subnets"
  type        = list(string)
  default     = ["subnet-1", "subnet-2", "subnet-3"]
}

# Public subnet need to use only in ALB/ELB if we need internat facing domain
variable "public_subnets_ids" {
  type        = list(string)
  description = "ALB of public subnets"
  default     = ["subnet-1", "subnet-2", "subnet-3"]
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
  default     = "here_zone_name"
}

variable "main_domain" {
  description = "Main domain name"
  default     = "steblynskyi.com"
}

variable "sub_domain" {
  description = "Subdomain for application"
  default     = "biztalk"
}

variable "OU" {
  default = "PROD Environment"
}

variable "cert_arn" {
  default = "arn:aws:acm:us-east-1:123:certificate/a21e50c9-56fd-438d-ba15-7e84db019a25"
}

variable "cert_prodsteblynskyi_arn" {
  default = "arn:aws:acm:us-east-1:123:certificate/111-222-333-444-555"
}

variable "ota_public_api" {
  default = "OTA-Public-API"
}

variable "ota_public_api_port" {
  default = 30990
}