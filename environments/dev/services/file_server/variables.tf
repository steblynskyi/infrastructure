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
  default     = "DEV"
}

variable "instance_type" {
  default = "t2.small"
}

variable "application" {
  default = "FileServer"
}

variable "ami_id" {
  default = "ami-0c93ccdfb9e7b5cc0"
}

# SG for ec2 instances
variable "security_group_ids_ec2" {
  type    = list(string)
  default = ["sg-1", "sg-2"]
}

# Private subnet to use on private resources
variable "ec2_private_subnet_id" {
  description = "EC2 private subnet"
  default     = "subnet-1"
}

variable "tag_terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

variable "key_name" {
  description = "Pem key for EC2 Instance"
  default     = "windows-admin"
}

variable "sub_domain" {
  description = "Subdomain for application"
  default     = "fileserver-center"
}

variable "OU" {
  default = "DEV Environment"
}

variable "route53_zone_id" {
  description = "Hosted Zone ID"
  default     = "Z1NMDDDDZ6A15"
}

variable "main_domain" {
  description = "Main domain name"
  default     = "dev-steblynskyi.com"
}
