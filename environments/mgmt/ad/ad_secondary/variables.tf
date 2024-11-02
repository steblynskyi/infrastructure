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
  default = "AD-Secondary"
}

variable "instance_type" {
  default = "t3.medium"
}

variable "iam_image" {
  default = "ami-0416f96ae3d1a3f29"
}

# SG for ec2 instances
variable "security_group_ids_ec2" {
  type    = list(string)
  default = ["sg-123"]
}

# Private subnet to use on private resources
variable "private_subnet_ids" {
  default = "subnet-123"
}

variable "network_private_ip" {
  default = "10.90.2.5"
}

variable "availability_zone" {
  description = "Zone Availability"
  default     = "us-east-1b"
}

variable "tag_terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

variable "key_name" {
  description = "Pem key for EC2 Instance"
  default     = "windows-admin"
}