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
  default     = "Scheduling-Services"
}

variable "ami_id" {
  description = "AMI ID"
  default     = "ami-02de527d960f9c15a"
}

variable "instance_type" {
  default = "t3.micro"
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

variable "route53_zone_id" {
  description = "Hosted Zone ID"
  default     = "Z1NMDDDDDD6A15"
}

variable "main_domain" {
  description = "Main domain name"
  default     = "qa-steblynskyi.com"
}

variable "sub_domain" {
  description = "Subdomain for application"
  default     = "scheduling"
}

variable "OU" {
  default = "QA Environment"
}