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
  default = "steblynskyi_admin"
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
  default     = "solarwinds-db"
}

variable "main_domain" {
  description = "Main domain name"
  default     = "steblynskyi.com"
}

variable "instance_type" {
  description = "Type of DB Instance"
  default     = "db.t3.small"
}

variable "identifier" {
  description = "Name of DataBase"
  default     = "solarwinds-prod"
}

variable "db_eng_version" {
  description = "DB engine version"
  default     = "5.7.37"
}

variable "storage_type" {
  description = "One of standard (magnetic), gp2 (general purpose SSD), or io1 (provisioned IOPS SSD)"
  default     = "gp2"
}

variable "eng_type" {
  description = "DB engine type"
  default     = "mysql"
}

variable "allocated_storage" {
  description = "The amount of allocated storage"
  default     = "30"
}

variable "max_allocated_storage" {
  description = "The amount of max allocated storage"
  default     = "40"
}

variable "ca_cert_identifier" {
  description = "CA certificate for the DB instance"
  default     = "rds-ca-2019"
}

variable "option_group" {
  description = "Name of the DB option group to associate"
  default     = "default:mysql-5-7"
}

variable "parameter_group_name" {
  description = "Default parameter group name"
  default = "default.mysql5.7"
}