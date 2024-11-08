resource "aws_db_instance" "this" {
  instance_class         = var.instance_type
  identifier             = var.identifier
  engine_version         = var.db_eng_version
  vpc_security_group_ids = var.security_group_ids
  storage_type           = var.storage_type
  skip_final_snapshot    = true
  apply_immediately      = true
  deletion_protection    = true
  replicate_source_db    = var.primary_db_name
  max_allocated_storage  = var.max_storage

  tags = {
    Terraform = var.terraform
    PrimaryDB = var.primary_db_name
  }
}

# Route53 Configuration for basic CNAME Record
resource "aws_route53_record" "cname_route53_record" {
  zone_id = var.route53_zone_id
  name    = local.app_domain
  type    = "CNAME"
  ttl     = "300"
  records = [aws_db_instance.this.address]
}
