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
  default     = "Scheduling-Services"
}

variable "ami_id" {
  description = "AMI ID"
  default     = "ami-0609024fef9a83d2d"
}

variable "instance_type" {
  default = "t3.medium"
}

# SG for ALB/ELB
variable "security_group_ids_elb" {
  type    = list(string)
  default = ["sg-1"]
}

# SG for ec2 instances
variable "security_group_ids_ec2" {
  type    = list(string)
  default = ["sg-1", "sg-2"]
}

# Subnet id for EC2
variable "ec2_private_subnet_id" {
  description = "EC2 private subnet id"
  default     = "sg-1"
}

# Private subnet to use on private resources
variable "private_subnet_ids" {
  type    = list(string)
  default = ["subnet-1", "subnet-2", "subnet-3"]
}

# Public subnet need to use only in ALB/ELB if we need internat facing domain
variable "public_subnet_ids" {
  type        = list(string)
  description = "List of public subnets"
  default     = ["subnet-1", "subnet-2", "subnet-3"]
}

variable "tag_terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

variable "key_name" {
  description = "Pem key for EC2 Instance"
  default     = "windows-admin"
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
  default     = "scheduling"
}

variable "OU" {
  default = "PROD Environment"
}