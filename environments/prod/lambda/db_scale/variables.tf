variable "region" {
  description = "Which region envirment will be created"
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

variable "permission_action" {
  description = "Permission to execute"
  default     = "lambda:InvokeFunction"
}

variable "permission_principal" {
  description = "Permission to execute"
  default     = "events.amazonaws.com"
}
