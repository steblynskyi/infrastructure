variable "region" {
  description = "Which region envirment will be created"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile name on local machine for multi aws account use"
  default     = "taras"
}

variable "vpc_id" {
  description = "QA-VPC"
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
  default     = "QA-VPC"
}

variable "db_username" {
  default = "devops"
}

variable "db_password" {}

variable "delete_automated_backups" {}

variable "db_subnet_group" {
  description = "DB subnet group which has been created with Network terraform template"
  default     = "qa-vpc"
}

variable "route53_zone_id" {
  description = "Hosted Zone ID"
  default     = "Z1NDDDDD4Z6A15"
}

variable "sub_domain" {
  description = "Subdomain for application"
  default     = "innsights-db"
}

variable "main_domain" {
  description = "Main domain name"
  default     = "qa-steblynskyi.com"
}

variable "db_snapshot" {
  description = "DB snapshot identifier to restore from"
  default     = "arn:aws:rds:us-east-1:123:snapshot:innsights-qa-2023-04-04-for-qa-refresh"
}

variable "identifier" {
  description = "Name of DataBase"
  default     = "innsights-qa"
}

variable "instance_type" {
  description = "Type of DB Instance"
  default     = "db.t3.medium"
}

variable "db_eng_version" {
  description = "DB engine version"
  default     = "14.6"
}

variable "storage_type" {
  description = "One of standard (magnetic), gp2 (general purpose SSD), or io1 (provisioned IOPS SSD)"
  default     = "gp2"
}

variable "allocated_storage" {
  description = "The amount of allocated storage"
  default     = "444"
}

variable "max_allocated_storage" {
  description = "The amount of max allocated storage"
  default     = "600"
}

variable "ca_cert_identifier" {
  description = "CA certificate for the DB instance"
  default     = "rds-ca-2019"
}

variable "option_group" {
  description = "Name of the DB option group to associate"
  default     = "default:postgres-14"
}

variable "parameter_group_name" {
  description = "Default parameter group name"
  default     = "default.postgres14"
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
  default     = "7"
}