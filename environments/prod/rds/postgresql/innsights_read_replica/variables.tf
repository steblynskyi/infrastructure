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

variable "route53_zone_id" {
  description = "Hosted Zone ID"
  default     = "here_zone_name"
}

variable "sub_domain" {
  description = "Subdomain for application"
  default     = "innsights-read-replica-db"
}

variable "main_domain" {
  description = "Main domain name"
  default     = "steblynskyi.com"
}

variable "primary_db_name" {
  description = "Name of DataBase"
  default     = "innsights-prod"
}

variable "identifier" {
  description = "Name of DataBase"
  default     = "innsights-read-replica-prod"
}

variable "instance_type" {
  description = "Type of DB Instance"
  default     = "db.t3.medium"
}

variable "db_eng_version" {
  description = "DB engine version"
  default     = "12.2"
}

variable "storage_type" {
  description = "One of standard (magnetic), gp2 (general purpose SSD), or io1 (provisioned IOPS SSD)"
  default     = "gp2"
}

variable "max_storage" {
  description = "The amount of allocated storage"
  default     = "1000"
}
