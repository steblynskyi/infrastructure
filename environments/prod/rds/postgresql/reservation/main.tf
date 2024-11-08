# RDS DB Configuration (we using snapshot if you need to create without snapshot you have to modify it)
resource "aws_db_instance" "reservation" {
  instance_class               = var.instance_type
  identifier                   = var.identifier
  username                     = var.db_username
  password                     = var.db_password
  db_subnet_group_name         = var.db_subnet_group
  vpc_security_group_ids       = var.security_group_ids
  engine_version               = var.db_eng_version
  deletion_protection          = true
  skip_final_snapshot          = true
  apply_immediately            = true # Can be changed to "true" if you need to apply the changes immediately
  storage_type                 = "gp2"
  max_allocated_storage        = 1000
  parameter_group_name         = "reservation-postgresql-14"
  performance_insights_enabled = true
  multi_az                     = true
  allow_major_version_upgrade  = true
  ca_cert_identifier           = "rds-ca-2019"

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
  records = [aws_db_instance.reservation.address]
}