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

variable "main_domain" {
  default     = "mgmt-steblynskyi.com"
  description = "Main domain"
  type        = string
}

variable "environment" {
  default     = "Mgmt"
  description = "Environment"
  type        = string
}

variable "vpc_id" {
  default     = "vpc-123"
  description = "VPC ID"
  type        = string
}

variable "name" {
  default     = "ci"
  description = "Name to be use in cluster"
  type        = string
}

variable "cluster_version" {
  default     = "1.30"
  description = "Kubernetes version"
  type        = string
}

variable "cluster_endpoint_public_access" {
  default     = true
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled"
  type        = bool
}

variable "additional_security_group_id" {
  default     = "sg-123"
  description = "Additional Security Id"
  type        = string
}

variable "managed_node_group_ami_type" {
  default     = "AL2_x86_64"
  description = "ami type"
  type        = string
}

variable "managed_node_group_disk_size" {
  default     = 50
  description = "Disk size"
}

variable "managed_node_group_desired_size" {
  default     = 3
  description = "Desired size"
}

variable "managed_node_group_min_size" {
  default     = 3
  description = "Min size"
}

variable "managed_node_group_max_size" {
  default     = 3
  description = "Max size"
}

variable "managed_node_group_capacity_type" {
  default     = "SPOT"
  description = "Capacity Type"
  type        = string
}

variable "managed_node_group_instance_types" {
  default     = ["t3.small", "t3.medium","t3a.small", "t3a.medium"]
  description = "Capacity Type"
  type        = list(string)
}

variable "managed_node_group_remote_access_key" {
  default     = "linux-admin"
  description = "Remote Access Key"
  type        = string
}

variable "karpenter_namespace" {
  default     = "karpenter"
  description = "karpenter namespace"
  type        = string
}

variable "karpenter_name" {
  default     = "karpenter"
  description = "karpenter name"
  type        = string
}

variable "karpenter_repository" {
  default     = "oci://public.ecr.aws/karpenter"
  description = "karpenter repository"
  type        = string
}

variable "karpenter_chart" {
  default     = "karpenter"
  description = "karpenter"
  type        = string
}

variable "karpenter_version" {
  default     = "v0.27.3"
  description = "karpenter version"
  type        = string
}
