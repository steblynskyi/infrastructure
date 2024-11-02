variable "region" {
  description = "Which region environment will be created"
  default     = "us-east-1"
}

variable "vpc_id" {
  default = "vpc-123"
}

variable "environment" {
  description = "Environment name"
  default     = "Mgmt"
}

variable "aws_profile" {
  description = "AWS Profile"
  default     = "taras"
}

variable "tag_terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

variable "application" {
  description = "Name of application"
  default     = "Jenkins-Master"
}

variable "ami_id" {
  description = "AMI ID"
  default     = "ami-07745d228b72075ab"
}

variable "instance_type" {
  default = "t3a.large"
}

# SG for ALB/ELB
variable "security_group_ids_elb" {
  type    = list(string)
  default = ["sg-123"]
}

# SG for ec2 instances
variable "security_group_ids_ec2" {
  type    = list(string)
  default = ["sg-123"]
}

variable "public_subnet_ids" {
  description = "Public Subnets for ALB"
  type        = list(string)
  default     = ["subnet-1", "subnet-2", "subnet-3"]
}

variable "private_subnet_ids" {
  description = "Public Subnets for ALB"
  type        = list(string)
  default     = ["subnet-1", "subnet-2", "subnet-3"]
}

variable "ec2_private_subnet_id" {
  description = "EC2 private subnet"
  default     = "subnet-1"
}

variable "key_name" {
  description = "Pem key for EC2 Instance"
  default     = "linux-admin"
}

variable "health_check" {
  description = "Type of Health Check"
  default     = "EC2"
}

variable "route53_zone_id" {
  description = "Hosted Zone ID"
  default     = "ZCVFR3VNKUSRHC7"
}

variable "main_domain" {
  description = "Main domain name"
  default     = "mgmt-steblynskyi.com"
}

variable "sub_domain_int" {
  description = "Subdomain for application"
  default     = "jenkins-master-internal"
}

variable "sub_domain_ext" {
  description = "Subdomain for application"
  default     = "jenkins-master-external"
}

variable "cert_arn" {
  default = "arn:aws:acm:us-east-1:123:certificate/111-222-333-96e1-555"
}