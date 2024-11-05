variable "aws_region" {
  default     = "us-east-1"
  description = "AWS Region"
  type        = string
}

variable "aws_profile" {
  default     = "taras"
  description = "AWS Profile"
  type        = string
}

variable "kubernetes_host" {
  default     = "https://api-kube.qa-steblynskyi.com"
  description = "Kubernetes host"
  type        = string
}

variable "kubernetes_context" {
  default     = "kube.qa-steblynskyi.com"
  description = "Kubernetes context"
  type        = string
}

variable "main_domain" {
  default     = "qa-steblynskyi.com"
  description = "Main domain"
  type        = string
}

variable "dns_zone_id" {
  default     = "Z1NDFRT4Z6A15"
  description = "DNS Zone ID"
  type        = string
}

variable "environment" {
  default     = "qa"
  description = "Environment"
  type        = string
}

variable "vpc_id" {
  default     = "vpc-123"
  description = "VPC ID"
  type        = string
}