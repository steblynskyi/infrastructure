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
  default     = "task-event-source-prod"
}

variable "main_read_capacity" {
  description = "Main Read Capacity"
  default     = 300
}

variable "main_write_capacity" {
  description = "Main Write Capacity"
  default     = 70
}

variable "main_hash_key" {
  description = "Add hash key"
  default     = "StreamId"
}

variable "main_range_key" {
  description = "Add range key"
  default     = "CommitSequence"
}

variable "attribute_name01" {
  description = "Add attribute name"
  default     = "CommitSequence"
}

variable "attribute_type01" {
  description = "Add attribute type"
  default     = "N"
}

variable "attribute_name02" {
  description = "Add attribute name"
  default     = "StreamId"
}

variable "attribute_type02" {
  description = "Add attribute type"
  default     = "S"
}

variable "main_stream_view_type" {
  default = "NEW_AND_OLD_IMAGES"
}