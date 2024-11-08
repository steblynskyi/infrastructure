resource "aws_kms_alias" "this" {
  name          = var.name
  target_key_id = aws_kms_key.this.id
}

resource "aws_kms_key" "this" {
  description              = var.description
  customer_master_key_spec = var.customer_master_key_spec
  key_usage                = var.key_usage
  is_enabled               = var.is_enabled
  enable_key_rotation      = var.enable_key_rotation
  policy                   = file("key_policy.json")

  tags = {
    Terraform   = var.terraform
    Environment = var.environment
  }
}