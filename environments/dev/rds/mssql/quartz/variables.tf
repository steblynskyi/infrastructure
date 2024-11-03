# RDS Configuration

variable "region" {
  description = "Which region envirment will be created"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile name on local machine for multi aws account use"
  default     = "taras"
}

variable "vpc_id" {
  description = "DEV-VPC"
  default     = "vpc-123"
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
  default     = "DEV-VPC"
}

variable "db_username" {
  default = "steblynskyi_admin"
}

variable "db_password" {}

variable "delete_automated_backups" {}

variable "db_subnet_group" {
  description = "DB subnet group which has been created with Network terraform template"
  default     = "dev-vpc"
}

variable "route53_zone_id" {
  description = "Hosted Zone ID"
  default     = "Z1NMDDDDDZ6A15"
}

variable "sub_domain" {
  description = "Subdomain for application"
  default     = "sql-quartz"
}

variable "main_domain" {
  description = "Main domain name"
  default     = "dev-steblynskyi.com"
}

variable "instance_type" {
  description = "Type of DB Instance"
  default     = "db.t3.small"
}

variable "identifier" {
  description = "Name of DataBase"
  default     = "quartz-dev"
}

variable "db_eng_version" {
  description = "DB engine version"
  default     = "12.00.6329.1.v1"
}

variable "option_group" {
  description = "Name of the DB option group to associate"
  default     = "default:sqlserver-web-12-00"
}

variable "parameter_group_name" {
  description = "Default parameter group name"
  default     = "default.sqlserver-web-12.0"
}

variable "db_snapshot" {
  description = "DB snapshot identifier to restore from"
  default     = "arn:aws:rds:us-east-1:123:snapshot:rds:quartz-dev-2021-02-18-06-08"
}

variable "storage_type" {
  description = "One of standard (magnetic), gp2 (general purpose SSD), or io1 (provisioned IOPS SSD)"
  default     = "gp2"
}

variable "allocated_storage" {
  description = "The amount of allocated storage"
  default     = "100"
}

variable "max_allocated_storage" {
  description = "The amount of max allocated storage"
  default     = "120"
}

variable "backup_window" {
  description = "The backup window"
  default     = "02:00-02:30"
}

variable "maintenance_window" {
  description = "The instance maintenance window"
  default     = "Sat:01:00-Sat:01:30"
}

variable "backup_retention_period" {
  description = "The days to retain backups"
  default     = "1"
}