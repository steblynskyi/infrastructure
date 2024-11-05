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

variable "terraform" {
  default = "True"
}

variable "cluster_id" {
  default = "session-qa"
}

variable "engine" {
  default = "redis"
}

variable "engine_version" {
  default = "5.0.6"
}

variable "node_type" {
  default = "cache.t3.medium"
}

variable "parameter_group_name" {
  default = "default.redis5.0"
}

variable "num_cache_nodes" {
  default = 1
}

variable "apply_immediately" {
  default = true
}

variable "subnet_group_name" {
  default = "qa-vpc"
}

variable "security_group_ids" {
  type    = list(string)
  default = ["sg-1", "sg-2"]
}

variable "route53_zone_id" {
  description = "Hosted Zone ID"
  default     = "Z1NMDDDDD4Z6A15"
}

variable "sub_domain" {
  description = "Subdomain for application"
  default     = "redis-session"
}

variable "main_domain" {
  description = "Main domain name"
  default     = "qa-steblynskyi.com"
}
