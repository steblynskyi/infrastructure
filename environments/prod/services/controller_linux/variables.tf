variable "region" {
  description = "Which region envirment will be created"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile name on local machine for multi aws account use"
  default     = "taras"
}

variable "vpc_id" {
  description = "PROD-VPC"
  default     = "vpc-123"
}

variable "environment" {
  description = "Environment name"
  default     = "PROD"
}

variable "application" {
  default = "Controller-Linux"
}

variable "instance_type" {
  default = "t3.medium"
}

variable "iam_image" {
  description = "Ubuntu 20.04 LTS AMI"
  default     = "ami-083654bd07b5da81d"
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
  default     = "linux-admin"
}

variable "route53_zone_id" {
  description = "Zone ID of Route53"
  default     = "here_zone_name"
}

variable "main_domain" {
  default = "steblynskyi.com"
}

variable "sub_domain" {
  default = "controller-linux"
}