variable "region" {
  description = "Which region envirment will be created"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile name on local machine for multi aws account use"
  default     = "taras"
}

variable "vpc_id" {
  description = "QA-VPC"
  default     = "vpc-123"
}

variable "environment" {
  description = "Environment name"
  default     = "QA"
}

variable "application" {
  description = "Name of application"
  default     = "Support"
}

variable "codedeploy_app_name" {
  default = "Support"
}

variable "ami_id" {
  description = "AMI ID for Windows 2016 Server"
  default     = "ami-09e026ca11ff911f1"
}

variable "instance_type" {
  default = "t3.micro"
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

# Private subnet to use on private resources
variable "private_subnet_ids" {
  type    = list(string)
  default = ["subnet-1", "subnet-2"]
}

variable "tag_terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

# Public subnet need to use only in ALB/ELB if we need internat facing domain
variable "public_subnets" {
  type        = list(string)
  description = "List of public subnets"
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
  default     = "here"
}

variable "main_domain" {
  description = "Main domain name"
  default     = "qa-steblynskyi.com"
}

variable "sub_domain" {
  description = "Subdomain for application"
  default     = "support"
}

variable "iam_role_codedeploy" {
  default = "arn:aws:iam::123:role/CodeDeploy_Service"
}

variable "OU" {
  default = "QA Environment"
}

variable "cert_arn" {
  default = "arn:aws:acm:us-east-1:123:certificate/111-2222-333-333-4444"
}