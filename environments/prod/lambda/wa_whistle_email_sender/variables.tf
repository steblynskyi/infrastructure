variable "region" {
  description = "Which region envirment will be created"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile name on local machine for multi aws account use"
  default     = "taras"
}

variable "vpc_id" {
  description = "PROD-VPC"
  default     = "vpc-123"
}

variable "environment" {
  description = "Name of Enviroment"
  default     = "PROD"
}

variable "tag_terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

variable "zip_filename" {
  description = "The local filename of the lambda function source archive"
  default     = "wa-whistle-email-sender.zip"
}

variable "iam_role" {
  description = "IAM Role for Lambda Function"
  default     = "arn:aws:iam::123:role/wa_whistle_main_role"
}

variable "function_name" {
  description = "A unique name for your Lambda Function"
  default     = "WA-Whistle-Email-Sender-PROD"
}

variable "message_handler" {
  description = "Message of handler"
  default     = "WhistleClientIntegrator.LambdaFunction::WhistleClientIntegrator.LambdaFunction.Function::FunctionHandler"
}

variable "runtime_version" {
  description = "Version of runtime"
  default     = "dotnetcore3.1"
}

variable "memory_size" {
  description = "Function is allocated CPU proportional to the memory configured "
  default     = "512"
}

variable "security_group_id" {
  description = "Default Lambda SG"
  default     = "sg-1"
}

variable "subnet_a" {
  description = "Private subnet A"
  default     = "sg-1"
}

variable "subnet_b" {
  description = "Private subnet B"
  default     = "subnet-2"
}

variable "subnet_c" {
  description = "Private subnet C"
  default     = "subnet-3"
}

variable "statement_id" {
  description = "A unique statement identifier"
  default     = "AllowExecutionFromCloudWatch"
}

variable "action" {
  description = "The AWS Lambda action you want to allow in this statement"
  default     = "lambda:InvokeFunction"
}

variable "principal" {
  description = "The principal who is getting this permission"
  default     = "events.amazonaws.com"
}