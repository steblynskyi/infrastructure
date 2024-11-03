
# Observability
This document highlight important details of observability implementation.

## Table of contents

- [ElasticSearch](#elasticSearch)
- [Indexes and Naming Convention](#indexes-and-naming-convention)
- [Steps to enable streaming from CloudWatch Log Group to ES](#steps-to-enable-streaming-from-cloudwatch-log-group-to-es)
- [Kibana Dashboards for VPC Flow Log Analysis](#kibana-dashboards-for-vpc-flow-log-analysis)
- [Storage Requirement for ElasticSearch](#storage-requirement-for-elasticsearch)
- [CloudWatch Alarms for ElasticSearch]()

## ElasticSearch
We are using Amazon OpenSearch service for centralized storage/indexing/aggregating Log data from various sources (CloudWatch/RDS/Kubernetes)

URL: `https://observer-es.mgmt-steblynskyi.com`




### Indexes and Naming convention

- There are two types of index in ES domain:

1. Index which gets created by CloudWatch(CW) Logs streaming to ES. So if we have enabled Subscription filter(i.e. streaming to ES) on CW Log group of RDS/VPC Flow Logs,etc. index names will be generated based on CW log group name.
2. Index which gets created by External Solutions (e.g. Kubernetes, Windows Server)


- CW Index Names:  All the index created by CW will be in the format: `cwl-LogGroupName-YYYY.MM.DD`

For example, If Dev VPC Flow logs CW Loggroup name is:

`DEV-VPC-Flow`

then ES index for today's date will be in this format:

`cwl-dev-vpc-flow-2022.03.09`

- Example of different index names:
1. VPC Flow Logs (of all env):
```
cwl-dev-vpc-flow-2022.03.05
cwl-qa-vpc-flow-2022.03.05
cwl-qa3-vpc-flow-2022.03.05
cwl-prod-vpc-flow-2022.03.05
```

2. RDS:
```
cwl-rds-innsights-qa-2022.03.05
```

3. Kubernetes (For Kubernetes audit logs of different env)
```
kube-audit-dev
kube-audit-qa
kube-audit-qa3
kube-audit-prod
```

4. Windows (For Windows audit logs):
```
win-audit-dev
```

### Steps to enable streaming from CloudWatch Log Group to ES
- Follow the steps mentioned here: https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_OpenSearch_Stream.html
- Use `lambda-stream-cw-to-es` IAM Role as Lambda IAM Execution Role



### Kibana Dashboards for VPC Flow Log Analysis

- Access OpenSearch Dashboard(i.e. Kibana) with: https://observer-es.mgmt-steblynskyi.com/_dashboards/app/dashboards

- For VPC Flow Log Anaylysis, navigate to `VPC Activity` Dashboard

- Refer file `vpc-flow-logs-opensearch-dashboard.json` for the dashboard defintion.



### Storage Requirement for ElasticSearch

Insufficient storage space is one of the most common causes of cluster instability, so we need to cross-check the numbers when we choose instance types, instance counts, and storage volumes.

For considering total storage requirement, we need to consider below aspects:
1. Total Size of Source Data


- Total Size of Source Data:
For rolling indices, you can multiply the amount of data generated during a representative time period by the retention period. For example, if you generate 200 MiB of log data per hour, that's 4.7 GiB per day, which is 66 GiB of data at any given time if you have a two-week retention period.

Below is the sample calculation for storage requirement, based on audit logs enabled in the corresponding environment and retention period we plan to keep the data (assuming we need to enable for each env)

| No | Log Item name      | Retention Period (in Days) | Daily Data Generation Size (in GB) | Total Generated Data Size (in GB)  For the rentention period |
|----|--------------------|----------------------------|------------------------------------|--------------------------------------------------------------|
| 1  | DEV-VPC-Flow-Logs  | 14                         | 17                                 | 238                                                          |
| 2  | QA-VPC-Flow-Logs   | 14                         | 17                                 | 238                                                          |
| 3  | QA3-VPC-Flow-Logs  | 14                         | 17                                 | 238                                                          |
| 4  | Prod-VPC-Flow-Logs | 30                         | 17                                 | 510                                                          |
| 5  | Dev-RDS            | 14                         | 20                                 | 280                                                          |
| 6  | QA-RDS             | 14                         | 20                                 | 280                                                          |
| 7  | Prod-RDS           | 30                         | 20                                 | 600                                                          |
| 8  | Dev-Kube           | 14                         | 30                                 | 420                                                          |
| 9  | QA-Kube            | 14                         | 30                                 | 420                                                          |
| 10 | QA3-Kube           | 14                         | 30                                 | 420                                                          |
| 11 | Prod-Kube          | 30                         | 30                                 | 900                                                          |
| 12 | win-dev-audit      | 30                         | 20                                 | 600                                                          |
| 13 |                    |                            | **TOTAL**                              | **5144 GB ~ 5.1 TB**                                             |                                                             |

Source Data * (1 + Number of Replicas) * 1.45 = Minimum Storage Requirement

5144 * (1+1) * 1.45 = 14917 GB Total required Storage For ES

https://docs.aws.amazon.com/opensearch-service/latest/developerguide/sizing-domains.html


### CloudWatch Alarms for ElasticSearch
- Since we are using single ES cluster for storing logs data of different environments and systems, its important to monitor ES cluster for high availability and get notification on critical issue.

- Below metrics are being monitored and on trigger of threshold value, CW alarm will notify SNS Topic `IRDevEmailAlerts`
    1. ClusterStatus.red maximum is >= 1 for 1 minute, 1 consecutive time
    2. ClusterStatus.yellow maximum is >= 1 for 1 minute, 1 consecutive time
    3. FreeStorageSpace minimum is <= 20480 for 1 minute, 1 consecutive time
    4. ClusterIndexWritesBlocked is >= 1 for 5 minutes, 1 consecutive time
    5. CPUUtilization or WarmCPUUtilization maximum is >= 80% for 15 minutes, 3 consecutive times
    6. JVMMemoryPressure maximum is >= 80% for 5 minutes, 3 consecutive times
- Reference: https://docs.aws.amazon.com/opensearch-service/latest/developerguide/cloudwatch-alarms.html