variable "region" {
  description = "Which region envirment will be created"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile name on local machine for multi aws account use"
  default     = "taras"
}

variable "terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

variable "environment" {
  description = "Environment name"
  default     = "PROD"
}

variable "name" {
  description = "The display name of the alias"
  default     = "alias/identity-api-prod"
}

variable "customer_master_key_spec" {
  description = "Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports"
  default     = "SYMMETRIC_DEFAULT"
}

variable "key_usage" {
  description = "Specifies the intended use of the key"
  default     = "ENCRYPT_DECRYPT"
}

variable "description" {
  description = "The description of the key as viewed in AWS console"
  default     = "Used to encrypt tokens"
}

variable "is_enabled" {
  description = "Specifies whether the key is enabled"
  default     = "true"
}

variable "enable_key_rotation" {
  description = "Specifies whether key rotation is enabled"
  default     = "false"
}