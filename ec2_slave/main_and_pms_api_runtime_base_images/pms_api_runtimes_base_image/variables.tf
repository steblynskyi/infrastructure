variable "region" {
  description = "Which region envirment will be created"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile"
  default     = "taras"
}
variable "environment" {
  description = "Environment name"
  default     = "Mgmt"
}

variable "instance_type" {
  default = "t3.medium"
}

variable "ec2_name" {
  default = "PMS-API-Runtime-Base-Image"
}

variable "iam_image" {
  default = "ami-1"
}

# SG for ec2 instances
variable "security_group_ids_ec2" {
  type    = list(string)
  default = ["sg-1", "sg-2"]
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