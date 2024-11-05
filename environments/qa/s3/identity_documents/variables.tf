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

variable "environment" {
  description = "Environment name"
  default     = "QA"
}

variable "terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

variable "s3_name" {
  description = "Default name of S3 bucket"
  default     = "steblynskyi-qa-identity-documents"
}

variable "acl" {
  description = "ACL Rules"
  default     = "private" # Can be change to: "public-read or private"
}

variable "sse_algorithm" {
  description = "The server-side encryption algorithm to use"
  default     = "aws:kms"
}

variable "kms_master_key_id" {
  description = "The AWS KMS master key ID used for the SSE-KMS encryption"
  default     = "arn:aws:kms:us-east-1:123:key/43ff34-18c8-450e-9608-824879faae80"
}