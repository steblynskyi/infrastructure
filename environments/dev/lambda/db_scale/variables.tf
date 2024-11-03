variable "region" {
  description = "Which region environment will be created"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile name on local machine for multi aws account use"
  default     = "taras"
}

variable "tag_terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

variable "filename" {
  description = "The local filename of the lambda function source archive"
  default     = "RDSDBScale.zip"
}

variable "iam_role" {
  description = "IAM Role for Lambda Function"
  default     = "arn:aws:iam::123:role/wa_whistle_main_role"
}

variable "function_name" {
  description = "A unique name for your Lambda Function"
  default     = "RDSDBScale"
}

variable "handler" {
  description = "handler"
  default     = "RDSDBScale"
}

variable "runtime" {
  description = "Version of runtime"
  default     = "go1.x"
}

variable "memory_size" {
  description = "Function is allocated CPU proportional to the memory configured "
  default     = "256"
}
