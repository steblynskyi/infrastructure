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
  default     = "DEV"
}

variable "tag_terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

# Main Configuration
variable "main_table_name" {
  description = "Name of DyanmoDB Table"
  default     = "booking-engine-orchestration-dev"
}

variable "main_read_capacity" {
  description = "Main Read Capacity"
  default     = 10
}

variable "main_write_capacity" {
  description = "Main Write Capacity"
  default     = 10
}

variable "main_hash_key" {
  description = "Add hash key"
  default     = "requestId"
}

variable "main_range_key" {
  description = "Add range key"
  default     = "propertyId"
}

variable "attribute_name01" {
  description = "Add attribute name"
  default     = "domain"
}

variable "attribute_type01" {
  description = "Add attribute type"
  default     = "S"
}

variable "attribute_name02" {
  description = "Add attribute name"
  default     = "propertyId"
}

variable "attribute_type02" {
  description = "Add attribute type"
  default     = "S"
}

variable "attribute_name03" {
  description = "Add attribute name"
  default     = "requestId"
}

variable "attribute_type03" {
  description = "Add attribute type"
  default     = "S"
}

# Global Secondary Index Configuration
variable "global_name" {
  description = "Name of Global Secondary Index"
  default     = "domain-index"
}

variable "global_hash_key" {
  description = "Add hash key"
  default     = "domain"
}

variable "global_read_capacity" {
  description = "Global Secondary Index Read Capacity"
  default     = 10
}

variable "global_write_capacity" {
  description = "Global Secondary Index Write Capacity"
  default     = 10
}

variable "global_projection_type" {
  description = "Global Secondary Index Projection Type"
  default     = "ALL"
}
