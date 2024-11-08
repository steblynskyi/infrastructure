output "Cluster-Name" {
  value = aws_elasticache_replication_group.this.replication_group_id
}

output "Domain" {
  value = aws_route53_record.cname_route53_record.name
}