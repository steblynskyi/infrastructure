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
variable "table_name" {
  description = "Name of DyanmoDB Table"
  default     = "portal-engine-config-dev"
}

variable "read_capacity" {
  description = "Main Read Capacity"
  default     = 5
}

variable "write_capacity" {
  description = "Main Write Capacity"
  default     = 5
}

variable "hash_key" {
  description = "Add hash key"
  default     = "ConfigurationId"
}

variable "range_key" {
  description = "Add range key"
  default     = "ClientId"
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
  default     = "ClientId"
}

variable "attribute_type02" {
  description = "Add attribute type"
  default     = "N"
}



