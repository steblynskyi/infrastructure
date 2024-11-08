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
  default     = "PROD"
}

variable "application" {
  default = "Controller-Windows"
}

variable "instance_type" {
  default = "t3.large"
}

variable "iam_image" {
  default = "ami-09f2114fecbe506e2"
}

# SG for ec2 instances
variable "security_group_ids_ec2" {
  type    = list(string)
  default = ["sg-2"]
}

# Private subnet to use on private resources
variable "public_subnet_ids" {
  default = "subnet-1"
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
  description = "Zone ID of Route53"
  default     = "here_zone_name"
}

variable "main_domain" {
  default = "steblynskyi.com"
}

variable "sub_domain" {
  default = "controller-windows"
}

variable "OU" {
  default = "PROD Environment"
}