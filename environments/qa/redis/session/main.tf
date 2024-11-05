# Single instance of redis
resource "aws_elasticache_cluster" "session" {
  cluster_id           = var.cluster_id
  engine               = var.engine
  engine_version       = var.engine_version
  node_type            = var.node_type
  parameter_group_name = var.parameter_group_name
  num_cache_nodes      = var.num_cache_nodes
  subnet_group_name    = var.subnet_group_name
  security_group_ids   = var.security_group_ids
  apply_immediately    = var.apply_immediately

  tags = {
    Name      = var.cluster_id
    Terraform = var.terraform
  }
}

# Route53 Configuration for basic CNAME Record
resource "aws_route53_record" "cname_route53_record" {
  zone_id = var.route53_zone_id
  name    = local.app_domain
  type    = "CNAME"
  ttl     = "300"
  records = [aws_elasticache_cluster.session.cache_nodes[0].address]

  depends_on = [aws_elasticache_cluster.session]
}
