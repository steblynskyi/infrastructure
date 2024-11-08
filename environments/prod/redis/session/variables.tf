variable "region" {
  description = "Which region envirment will be created"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile name on local machine for multi aws account use"
  default     = "taras"
}

variable "tag_terraform" {
  default     = "True"
}

variable "cluster_id" {
  default = "session-prod"
}

variable "engine" {
  default = "redis"
}

variable "engine_version" {
  default = "5.0.6"
}

variable "node_type" {
  //  default = "cache.m5.large"
  default = "cache.r5.large"
}

variable "port" {
  default = 6379
}

variable "parameter_group_name" {
  default = "default.redis5.0"
}

variable "apply_immediately" {
  default = true
}

variable "subnet_group_name" {
  default = "prod-vpc"
}

variable "num_cache_nodes" {
  default = 2
}

variable "security_group_ids" {
  type    = list(string)
  default = ["sg-1"]
}

variable "route53_zone_id" {
  description = "Hosted Zone ID"
  default     = "here_zone_name"
}

variable "sub_domain" {
  description = "Subdomain for application"
  default     = "session"
}

variable "main_domain" {
  description = "Main domain name"
  default     = "steblynskyi.com"
}