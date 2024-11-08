# RDS DB Configuration (we using snapshot if you need to create without snapshot you have to modify it)
resource "aws_db_instance" "this" {
  instance_class               = var.instance_type
  identifier                   = var.identifier
  username                     = var.db_username
  password                     = var.db_password
  db_subnet_group_name         = var.db_subnet_group
  engine                       = var.eng_type
  engine_version               = var.db_eng_version
  vpc_security_group_ids       = var.security_group_ids
  storage_type                 = var.storage_type
  allocated_storage            = var.allocated_storage
  max_allocated_storage        = var.max_allocated_storage
  ca_cert_identifier           = var.ca_cert_identifier
  option_group_name            = var.option_group
  parameter_group_name         = var.parameter_group_name
  allow_major_version_upgrade  = true
  skip_final_snapshot          = true
  apply_immediately            = true
  deletion_protection          = true
  performance_insights_enabled = false

  delete_automated_backups     = var.delete_automated_backups
  # snapshot_identifier         = data.aws_db_snapshot.db_snapshot.id     # Uncommit it only when you're doing refresh from data "aws_db_snapshot" "db_snapshot".

  tags = {
    Terraform = var.terraform
    Name      = var.name
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