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
  default     = "PROD"
}

variable "tag_terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

# Main Configuration
variable "main_table_name" {
  description = "Name of DyanmoDB Table"
  default     = "toggles-prod"
}

variable "main_read_capacity" {
  description = "Main Read Capacity"
  default     = 10
}

variable "main_write_capacity" {
  description = "Main Write Capacity"
  default     = 1
}

variable "main_hash_key" {
  description = "Add hash key"
  default     = "propertyId"
}

variable "attribute_name01" {
  description = "Add attribute name"
  default     = "propertyId"
}

variable "attribute_type01" {
  description = "Add attribute type"
  default     = "S"
}