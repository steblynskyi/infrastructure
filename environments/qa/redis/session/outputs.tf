output "Cluster-Name" {
  value = aws_elasticache_cluster.session.cluster_id
}

output "Redis-Info" {
  value = aws_elasticache_cluster.session.cache_nodes
}

output "Domain" {
  value = aws_route53_record.cname_route53_record.name
}
