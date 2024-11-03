variable "region" {
  description = "Which region envirment will be created"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile name on local machine for multi aws account use"
  default     = "taras"
}

variable "vpc_id" {
  default = "vpc-123"
}

variable "domain_name" {
  description = "Default ElasticSearch Domain(Name of ES cluster)"
  default     = "opensearch-dev"
}

variable "environment" {
  description = "Environment name"
  default     = "DEV"
}

variable "tag_terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

variable "main_domain" {
  description = "Main domain name"
  default     = "dev-steblynskyi.com"
}

variable "sub_domain" {
  description = "Subdomain for application"
  default     = "opensearch"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs"
  default     = ["subnet-1","subnet-2"]
}

variable "security_groups_ids" {
  type        = list(string)
  description = "SG of ElasticSearch"
  default     = ["sg-1","sg-2"]
}

variable "es_version" {
  description = "Specify version of Elasticserach (For using Opensearch, mention it as `OpenSearch_Version`)"
  default     = "OpenSearch_2.5"
}

variable "es_instance_type" {
  description = "Instance type of data nodes in the cluster."
  default     = "t3.medium.elasticsearch"
}

variable "instance_count" {
  description = "Number of instances in the cluster."
  type        = number
  default     = 2
}

variable "ebs_volume_size" {
  type        = number
  description = "EBS volumes for data storage in GB"
  default     = 100
}

variable "zone_awareness_enabled" {
  type        = bool
  default     = true
  description = "Enable zone awareness for Elasticsearch cluster"
}

variable "dedicated_master_enabled" {
  type        = bool
  default     = false
  description = "Indicates whether dedicated master nodes are enabled for the cluster"
}

variable "dedicated_master_count" {
  type        = number
  description = "Number of dedicated master nodes in the cluster"
  default     = 3
}

variable "dedicated_master_type" {
  type        = string
  default     = "t3.medium.elasticsearch"
  description = "Instance type of the dedicated master nodes in the cluster"
}