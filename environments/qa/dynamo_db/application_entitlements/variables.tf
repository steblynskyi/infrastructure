variable "region" {
  description = "Which region envirment will be created"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile name on local machine for multi aws account use"
  default     = "taras"
}

variable "environment" {
  description = "Name of enviriment"
  default     = "QA"
}

variable "tag_terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

# Main Configuration
variable "main_table_name" {
  description = "Name of DyanmoDB Table"
  default     = "application-entitlements-qa"
}

variable "main_read_capacity" {
  description = "Main Read Capacity"
  default     = 20
}

variable "main_write_capacity" {
  description = "Main Write Capacity"
  default     = 10
}

variable "main_hash_key" {
  description = "Add hash key"
  default     = "ApplicationId"
}

variable "main_range_key" {
  description = "Add range key"
  default     = "Id"
}

variable "attribute_name01" {
  description = "Add attribute name"
  default     = "ApplicationId"
}

variable "attribute_type01" {
  description = "Add attribute type"
  default     = "S"
}

variable "attribute_name02" {
  description = "Add attribute name"
  default     = "Id"
}

variable "attribute_type02" {
  description = "Add attribute type"
  default     = "S"
}
