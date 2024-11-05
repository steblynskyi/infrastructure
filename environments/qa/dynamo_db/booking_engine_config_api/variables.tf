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
  default     = "booking-engine-config-api-qa"
}

variable "main_read_capacity" {
  description = "Main Read Capacity"
  default     = 10
}

variable "main_write_capacity" {
  description = "Main Write Capacity"
  default     = 5
}

variable "main_hash_key" {
  description = "Add hash key"
  default     = "ConfigurationId"
}

variable "main_range_key" {
  description = "Add range key"
  default     = "PropertyId"
}

variable "attribute_name01" {
  description = "Add attribute name"
  default     = "ConfigurationId"
}

variable "attribute_type01" {
  description = "Add attribute type"
  default     = "S"
}

variable "attribute_name02" {
  description = "Add attribute name"
  default     = "PropertyId"
}

variable "attribute_type02" {
  description = "Add attribute type"
  default     = "S"
}

variable "attribute_name03" {
  description = "Add attribute name"
  default     = "subDomain"
}

variable "attribute_type03" {
  description = "Add attribute type"
  default     = "S"
}

# Global Secondary Index Configuration
variable "global_name" {
  description = "Name of Global Secondary Index"
  default     = "subDomain"
}

variable "global_hash_key" {
  description = "Add hash key"
  default     = "subDomain"
}

variable "global_read_capacity" {
  description = "Global Secondary Index Read Capacity"
  default     = 5
}

variable "global_write_capacity" {
  description = "Global Secondary Index Write Capacity"
  default     = 5
}

variable "global_projection_type" {
  description = "Global Secondary Index Projection Type"
  default     = "ALL"
}
