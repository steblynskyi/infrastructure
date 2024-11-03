variable "region" {
  description = "Which region environment will be created"
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
  default     = "observer-mgmt"
}

variable "environment" {
  description = "Environment name"
  default     = "Mgmt"
}

variable "tag_terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

variable "main_domain" {
  description = "Main domain name"
  default     = "mgmt-steblynskyi.com"
}

variable "sub_domain" {
  description = "Subdomain for application"
  default     = "observer-es"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs"
  default     = ["subnet-1", "subnet-2", "subnet-3"]
}

variable "security_groups_ids" {
  type        = list(string)
  description = "SG of ElasticSearch"
  default     = ["sg-123"]
}

variable "es_version" {
  description = "Specify version of Elasticserach (For using Opensearch, mention it as `OpenSearch_Version`)"
  default     = "OpenSearch_1.3"
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
  default     = 200
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
  default     = "r5.large.elasticsearch"
  description = "Instance type of the dedicated master nodes in the cluster"
}

### CloudWatch Alarms Section
variable "alarm_name_prefix" {
  description = "Alarm name prefix, used in the naming of alarms created"
  type        = string
  default     = ""
}

variable "alarm_name_postfix" {
  description = "Alarm name suffix, used in the naming of alarms created"
  type        = string
  default     = ""
}

variable "sns_topic" {
  description = "SNS topic you want to specify."
  type        = string
  default     = "Observer-ES-Mgmt"
}

########################################
# Boolean flagging to disable specific alarms not interested in using
########################################
variable "monitor_cluster_status_is_red" {
  description = "Enable monitoring of cluster status is in red"
  type        = bool
  default     = true
}

variable "monitor_cluster_status_is_yellow" {
  description = "Enable monitoring of cluster status is in yellow"
  type        = bool
  default     = true
}

variable "monitor_free_storage_space_too_low" {
  description = "Enable monitoring of cluster per-node free storage is too low"
  type        = bool
  default     = true
}

variable "monitor_free_storage_space_total_too_low" {
  description = "Enable monitoring of cluster total free storage is too low.  Disabled by default, if you set this you must set free_storage_space_total_threshold also"
  type        = bool
  default     = false
}

variable "monitor_cluster_index_writes_blocked" {
  description = "Enable monitoring of cluster index writes being blocked"
  type        = bool
  default     = true
}

variable "monitor_cpu_utilization_too_high" {
  description = "Enable monitoring of CPU utilization is too high"
  type        = bool
  default     = true
}

variable "monitor_jvm_memory_pressure_too_high" {
  description = "Enable monitoring of JVM memory pressure is too high"
  type        = bool
  default     = true
}

########################################
# Evaluation period time length (in seconds) for alarms
########################################

variable "alarm_cluster_status_is_red_period" {
  description = "The period of the cluster status is in red should the statistics be applied in seconds"
  type        = number
  default     = 60
}

variable "alarm_cluster_status_is_yellow_period" {
  description = "The period of the cluster status is in yellow should the statistics be applied in seconds"
  type        = number
  default     = 60
}

variable "alarm_free_storage_space_too_low_period" {
  description = "The period of the per-node free storage is too low should the statistics be applied in seconds"
  type        = number
  default     = 60
}

variable "alarm_free_storage_space_total_too_low_period" {
  description = "The period of the total cluster free storage is too low should the statistics be applied in seconds"
  type        = number
  default     = 60
}

variable "alarm_cluster_index_writes_blocked_period" {
  description = "The period of the cluster index writes being blocked should the statistics be applied in seconds"
  type        = number
  default     = 300
}

variable "alarm_cpu_utilization_too_high_period" {
  description = "The period of the CPU utilization is too high should the statistics be applied in seconds"
  type        = number
  default     = 900
}

variable "alarm_jvm_memory_pressure_too_high_period" {
  description = "The period of the JVM memory pressure is too high should the statistics be applied in seconds"
  type        = number
  default     = 900
}

########################################
# Alarm thresholds
########################################
variable "free_storage_space_threshold" {
  description = "The minimum amount of available storage space in megabytes.  This is per-node."
  type        = number
  default     = 20480 ## 20 Gigabyte in MegaByte
}

variable "free_storage_space_total_threshold" {
  description = "The minimum amount of available storage space in megabytes aggregated across your cluster (for multi-node).  This is an aggregate, typically use (free_storage_space_threshold * min_available_nodes)"
  type        = number
  default     = 20480 ## 20 Gigabyte in MegaByte
}

variable "min_available_nodes" {
  description = "The minimum available (reachable) nodes to have, set to non-zero to enable"
  type        = number
  default     = 0
}


variable "cpu_utilization_threshold" {
  description = "The maximum percentage of CPU utilization"
  type        = number
  default     = 80 # 80 percent in Percentage
}

variable "jvm_memory_pressure_threshold" {
  description = "The maximum percentage of the Java heap used for all data nodes in the cluster"
  type        = number
  default     = 80 # 80 percent in Percentage
}

########################################
# Evaluation periods for alarms
########################################
variable "alarm_cluster_status_is_red_periods" {
  description = "The number of periods to alert that cluster status is red.  Default: 1, raise this to be less noisy, as this can occur often for only 1 period"
  type        = number
  default     = 1
}

variable "alarm_cluster_status_is_yellow_periods" {
  description = "The number of periods to alert that cluster status is yellow.  Default: 1, raise this to be less noisy, as this can occur often for only 1 period"
  type        = number
  default     = 1
}

variable "alarm_free_storage_space_too_low_periods" {
  description = "The number of periods to alert that the per-node free storage space is too low.  Default: 1, raise this to be less noisy, as this can occur often for only 1 period"
  type        = number
  default     = 1
}

variable "alarm_free_storage_space_total_too_low_periods" {
  description = "The number of periods to alert that total cluster free storage space is too low.  Default: 1, raise this to be less noisy, as this can occur often for only 1 period"
  type        = number
  default     = 1
}

variable "alarm_cluster_index_writes_blocked_periods" {
  description = "The number of periods to alert that cluster index writes are blocked.  Default: 1, raise this to be less noisy, as this can occur often for only 1 period"
  type        = number
  default     = 1
}

variable "alarm_cpu_utilization_too_high_periods" {
  description = "The number of periods to alert that CPU usage is too high.  Default: 3, raise this to be less noisy, as this can occur often for only 1 period"
  type        = number
  default     = 3
}

variable "alarm_jvm_memory_pressure_too_high_periods" {
  description = "The number of periods which it must be in the alarmed state to alert"
  type        = number
  default     = 1
}
