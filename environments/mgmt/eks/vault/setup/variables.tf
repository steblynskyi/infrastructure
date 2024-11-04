variable "region" {
  description = "Which region environment will be created"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile name on local machine for multi aws account use"
  default     = "taras"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "vault-mgmt"
}

# VPC ID for the EKS cluster
variable "vpc_id" {
  description = "The VPC ID for the EKS cluster"
  type        = string
  default     = "vpc-123"
}

# Public subnets to use
variable "public_subnets" {
  description = "The public subnets to use"
  type        = list(string)
  default     = ["subnet-1", "subnet-2", "subnet-3"]
}

# Private subnets to use
variable "private_subnets" {
  description = "The private subnets to use"
  type        = list(string)
  default     = ["subnet-1", "subnet-2", "subnet-3"]
}

# Kubernetes version to use
variable "kubernetes_version" {
  description = "The Kubernetes version to use"
  type        = string
  default     = "1.30"
}

# Kubernetes cidr block to use
variable "kubernetes_cidr" {
  description = "The Kubernetes cidr block to use"
  type        = string
  default     = "10.100.0.0/16"
}

# node_group_name
variable "node_group_name" {
  description = "The node group name"
  type        = string
  default     = "worker"
}

variable "environment" {
  description = "The environment name"
  type        = string
  default     = "Mgmt"
}

variable "lb_sg" {
  description = "The security group for the load balancer"
  type        = string
  default     = "sg-123"
}
