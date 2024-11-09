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
  default     = "Mgmt"
}

variable "application" {
  description = "Name of application"
  default     = "Jenkins-Slave-Windows-Net-4.7.2-MSBuild-16-Image"
}

variable "ami_id" {
  description = "Ubuntu 16.04 LTS AMI"
  default     = "ami-123"
}

variable "instance_type" {
  default = "t3a.small"
}

# SG for ec2 instances
variable "security_group_ids_ec2" {
  type    = list(string)
  default = ["sg-1"]
}

# Private subnet to use on private resources
variable "private_subnet_ids" {
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