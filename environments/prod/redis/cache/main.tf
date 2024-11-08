resource "aws_elasticache_replication_group" "this" {
  replication_group_id          = var.cluster_id
  description                   = "Prod Redis cache storage cluster"
  node_type                     = var.node_type
  num_cache_clusters            = var.num_cache_nodes
  port                          = var.port
  parameter_group_name          = var.parameter_group_name
  automatic_failover_enabled    = true
  subnet_group_name             = var.subnet_group_name
  security_group_ids            = var.security_group_ids
  engine_version                = var.engine_version

  tags = {
    Name        = var.cluster_id
    Terraform   = var.tag_terraform
  }

  apply_immediately = var.apply_immediately
}

# Route53 Configuration for basic CNAME Record
resource "aws_route53_record" "cname_route53_record" {
  zone_id    = var.route53_zone_id
  name       = local.app_domain
  type       = "CNAME"
  ttl        = "300"
  records    = [aws_elasticache_replication_group.this.primary_endpoint_address]
  depends_on = [aws_elasticache_replication_group.this]
}