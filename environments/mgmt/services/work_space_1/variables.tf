variable "vpc_id" {
  default = "vpc-123"
}

variable "environment" {
  description = "Environment name"
  default     = "Mgmt"
}

variable "region" {
  description = "Which region envirment will be created"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile name on local machine for multi aws account use"
  default     = "taras"
}

variable "application" {
  description = "Name of application"
  default     = "WorkSpace1"
}

variable "ami_id" {
  description = "AMI ID"
  default     = "ami-0da7a37366e7ee5f0"
}

variable "instance_type" {
  default = "t3a.xlarge"
}

# SG for ec2 instances
variable "security_group_ids_ec2" {
  type    = list(string)
  default = ["sg-123"]
}

# Subnet id for EC2
variable "ec2_private_subnet_id" {
  description = "EC2 public subnet id"
  default     = "subnet-123"
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
  default     = "ZCVFR3VNKUSRHC7"
}

variable "main_domain" {
  description = "Main domain name"
  default     = "mgmt-steblynskyi.com"
}

variable "sub_domain" {
  description = "Subdomain for application"
  default     = "workspace1"
}

variable "OU" {
  default = "Mgmt Environment"
}
