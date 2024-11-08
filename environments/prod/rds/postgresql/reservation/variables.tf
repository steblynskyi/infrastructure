variable "region" {
  description = "Which region envirment will be created"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile name on local machine for multi aws account use"
  default     = "taras"
}

variable "security_group_ids" {
  type    = list(string)
  default = ["sg-1", "sg-2"]
}

variable "terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

variable "name" {
  description = "Name of VPC"
  default     = "PROD-VPC"
}

variable "db_username" {
  default = "PostOps"
}

variable "db_password" {}

variable "delete_automated_backups" {}

variable "db_subnet_group" {
  description = "DB subnet group which has been created with Network terraform template"
  default     = "prod-vpc"
}

variable "route53_zone_id" {
  description = "Hosted Zone ID"
  default     = "here_zone_name"
}

variable "sub_domain" {
  description = "Subdomain for application"
  default     = "reservation-db"
}

variable "main_domain" {
  description = "Main domain name"
  default     = "steblynskyi.com"
}

variable "instance_type" {
  description = "Type of DB Instance"
  default     = "db.t3.2xlarge"
}

variable "identifier" {
  description = "Name of DataBase"
  default     = "reservation-prod"
}

variable "db_eng_version" {
  description = "DB engine version"
  default     = "14.6"
}

variable "db_snapshot" {
  description = "DB snapshot identifier to restore from"
  default     = "arn:aws:rds:us-east-1:123:snapshot:reservation-db-prod-2020-09-30-for-new-prod"
}