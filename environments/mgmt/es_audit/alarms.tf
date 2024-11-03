locals {
  thresholds = {
    FreeStorageSpaceThreshold        = floor(max(var.free_storage_space_threshold, 0))
    FreeStorageSpaceTotalThreshold   = floor(max(var.free_storage_space_total_threshold, 0))
    CPUUtilizationThreshold          = floor(min(max(var.cpu_utilization_threshold, 0), 100))
    JVMMemoryPressureThreshold       = floor(min(max(var.jvm_memory_pressure_threshold, 0), 100))
  }
}

# NOTE: this file configures the recommended Amazon ElasticSearch Alarms using CloudWatch and sends alerts to an SNS topic. 
# Reference: https://docs.aws.amazon.com/opensearch-service/latest/developerguide/cloudwatch-alarms.html

resource "aws_cloudwatch_metric_alarm" "cluster_status_is_red" {
  count               = var.monitor_cluster_status_is_red ? 1 : 0
  alarm_name          = "${var.alarm_name_prefix}ElasticSearch-ClusterStatusIsRed${var.alarm_name_postfix}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.alarm_cluster_status_is_red_periods
  datapoints_to_alarm = var.alarm_cluster_status_is_red_periods
  metric_name         = "ClusterStatus.red"
  namespace           = "AWS/ES"
  period              = var.alarm_cluster_status_is_red_period
  statistic           = "Maximum"
  threshold           = "1"
  alarm_description   = "Average elasticsearch cluster status is in red over last ${floor(var.alarm_cluster_status_is_red_periods * var.alarm_cluster_status_is_red_period / 60)} minute(s)"
  alarm_actions       = [data.aws_sns_topic.devops_sns_topic.arn]
  ok_actions          = [data.aws_sns_topic.devops_sns_topic.arn]
  treat_missing_data  = "ignore"
  tags                = {
    Domain      = var.domain_name
    Terraform   = true
    Environment = var.environment
  }

  dimensions = {
    DomainName = var.domain_name
    ClientId   = data.aws_caller_identity.current.account_id
  }
}

resource "aws_cloudwatch_metric_alarm" "cluster_status_is_yellow" {
  count               = var.monitor_cluster_status_is_yellow ? 1 : 0
  alarm_name          = "${var.alarm_name_prefix}ElasticSearch-ClusterStatusIsYellow${var.alarm_name_postfix}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.alarm_cluster_status_is_yellow_periods
  datapoints_to_alarm = var.alarm_cluster_status_is_yellow_periods
  metric_name         = "ClusterStatus.yellow"
  namespace           = "AWS/ES"
  period              = var.alarm_cluster_status_is_yellow_period
  statistic           = "Maximum"
  threshold           = "1"
  alarm_description   = "Average elasticsearch cluster status is in yellow over last ${floor(var.alarm_cluster_status_is_yellow_periods * var.alarm_cluster_status_is_yellow_period / 60)} minute(s)"
  alarm_actions       = [data.aws_sns_topic.devops_sns_topic.arn]
  ok_actions          = [data.aws_sns_topic.devops_sns_topic.arn]
  treat_missing_data  = "ignore"
  tags                = {
    Domain      = var.domain_name
    Terraform   = true
    Environment = var.environment
  }

  dimensions = {
    DomainName = var.domain_name
    ClientId   = data.aws_caller_identity.current.account_id
  }
}

resource "aws_cloudwatch_metric_alarm" "free_storage_space_too_low" {
  count               = var.monitor_free_storage_space_too_low ? 1 : 0
  alarm_name          = "${var.alarm_name_prefix}ElasticSearch-FreeStorageSpaceTooLow${var.alarm_name_postfix}"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = var.alarm_free_storage_space_too_low_periods
  datapoints_to_alarm = var.alarm_free_storage_space_too_low_periods
  metric_name         = "FreeStorageSpace"
  namespace           = "AWS/ES"
  period              = var.alarm_free_storage_space_too_low_period
  statistic           = "Minimum"
  threshold           = local.thresholds["FreeStorageSpaceThreshold"]
  alarm_description   = "Minimum free disk space on a single node under ${local.thresholds["FreeStorageSpaceThreshold"]}MB for the last ${floor(var.alarm_free_storage_space_too_low_periods * var.alarm_free_storage_space_too_low_period / 60)} minute(s)"
  alarm_actions       = [data.aws_sns_topic.devops_sns_topic.arn]
  ok_actions          = [data.aws_sns_topic.devops_sns_topic.arn]
  treat_missing_data  = "ignore"
  tags                = {
    Domain      = var.domain_name
    Terraform   = true
    Environment = var.environment
  }

  dimensions = {
    DomainName = var.domain_name
    ClientId   = data.aws_caller_identity.current.account_id
  }
}

resource "aws_cloudwatch_metric_alarm" "free_storage_space_total_too_low" {
  # If the user specified how many nodes, and they want to create this alert (disabled by default)
  count               = var.monitor_free_storage_space_total_too_low ? var.min_available_nodes > 0 ? 1 : 0 : 0
  alarm_name          = "${var.alarm_name_prefix}ElasticSearch-FreeStorageSpaceTotalTooLow${var.alarm_name_postfix}"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = var.alarm_free_storage_space_total_too_low_periods
  datapoints_to_alarm = var.alarm_free_storage_space_total_too_low_periods
  metric_name         = "FreeStorageSpaceTotal"
  namespace           = "AWS/ES"
  period              = var.alarm_free_storage_space_total_too_low_period
  statistic           = "Sum"
  threshold           = local.thresholds["FreeStorageSpaceTotalThreshold"]
  alarm_description   = "Total aggregate free disk space under ${local.thresholds["FreeStorageSpaceTotalThreshold"]}MB for the last ${floor(var.alarm_free_storage_space_total_too_low_periods * var.alarm_free_storage_space_total_too_low_period / 60)} minute(s)"
  alarm_actions       = [data.aws_sns_topic.devops_sns_topic.arn]
  ok_actions          = [data.aws_sns_topic.devops_sns_topic.arn]
  treat_missing_data  = "ignore"
  tags                = {
    Domain      = var.domain_name
    Terraform   = true
    Environment = var.environment
  }

  dimensions = {
    DomainName = var.domain_name
    ClientId   = data.aws_caller_identity.current.account_id
  }
}



resource "aws_cloudwatch_metric_alarm" "cluster_index_writes_blocked" {
  count               = var.monitor_cluster_index_writes_blocked ? 1 : 0
  alarm_name          = "${var.alarm_name_prefix}ElasticSearch-ClusterIndexWritesBlocked${var.alarm_name_postfix}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.alarm_cluster_index_writes_blocked_periods
  datapoints_to_alarm = var.alarm_cluster_index_writes_blocked_periods
  metric_name         = "ClusterIndexWritesBlocked"
  namespace           = "AWS/ES"
  period              = var.alarm_cluster_index_writes_blocked_period
  statistic           = "Maximum"
  threshold           = "1"
  alarm_description   = "Elasticsearch index writes being blocker over last ${floor(var.alarm_cluster_index_writes_blocked_periods * var.alarm_cluster_index_writes_blocked_period / 60)} minute(s)"
  alarm_actions       = [data.aws_sns_topic.devops_sns_topic.arn]
  ok_actions          = [data.aws_sns_topic.devops_sns_topic.arn]
  treat_missing_data  = "ignore"
  tags                = {
    Domain      = var.domain_name
    Terraform   = true
    Environment = var.environment
  }

  dimensions = {
    DomainName = var.domain_name
    ClientId   = data.aws_caller_identity.current.account_id
  }
}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization_too_high" {
  count               = var.monitor_cpu_utilization_too_high ? 1 : 0
  alarm_name          = "${var.alarm_name_prefix}ElasticSearch-CPUUtilizationTooHigh${var.alarm_name_postfix}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.alarm_cpu_utilization_too_high_periods
  datapoints_to_alarm = var.alarm_cpu_utilization_too_high_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ES"
  period              = var.alarm_cpu_utilization_too_high_period
  statistic           = "Average"
  threshold           = local.thresholds["CPUUtilizationThreshold"]
  alarm_description   = "Average elasticsearch cluster CPU utilization above ${local.thresholds["CPUUtilizationThreshold"]} over last ${floor(var.alarm_cpu_utilization_too_high_periods * var.alarm_cpu_utilization_too_high_period / 60)} minute(s) too high"
  alarm_actions       = [data.aws_sns_topic.devops_sns_topic.arn]
  ok_actions          = [data.aws_sns_topic.devops_sns_topic.arn]
  tags                = {
    Domain      = var.domain_name
    Terraform   = true
    Environment = var.environment
  }

  dimensions = {
    DomainName = var.domain_name
    ClientId   = data.aws_caller_identity.current.account_id
  }
}

resource "aws_cloudwatch_metric_alarm" "jvm_memory_pressure_too_high" {
  count               = var.monitor_jvm_memory_pressure_too_high ? 1 : 0
  alarm_name          = "${var.alarm_name_prefix}ElasticSearch-JVMMemoryPressure${var.alarm_name_postfix}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.alarm_jvm_memory_pressure_too_high_periods
  datapoints_to_alarm = var.alarm_jvm_memory_pressure_too_high_periods
  metric_name         = "JVMMemoryPressure"
  namespace           = "AWS/ES"
  period              = var.alarm_jvm_memory_pressure_too_high_period
  statistic           = "Maximum"
  threshold           = local.thresholds["JVMMemoryPressureThreshold"]
  alarm_description   = "Elasticsearch JVM memory pressure is over ${local.thresholds["JVMMemoryPressureThreshold"]} over the last ${floor(var.alarm_jvm_memory_pressure_too_high_periods * var.alarm_jvm_memory_pressure_too_high_period / 60)} minute(s)"
  alarm_actions       = [data.aws_sns_topic.devops_sns_topic.arn]
  ok_actions          = [data.aws_sns_topic.devops_sns_topic.arn]
  tags                = {
    Domain      = var.domain_name
    Terraform   = true
    Environment = var.environment
  }

  dimensions = {
    DomainName = var.domain_name
    ClientId   = data.aws_caller_identity.current.account_id
  }
}