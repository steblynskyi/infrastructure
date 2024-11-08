# Config of S3 Bucket
resource "aws_s3_bucket" "this" {
  bucket = var.s3_name

  tags = {
    VPC-ID      = var.vpc_id
    Environment = var.environment
    Terraform   = var.terraform
  }
}

# Cors Configuration
resource "aws_s3_bucket_cors_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["POST", "GET"]
    allowed_origins = ["https://*.steblynskyi.com", "http://*.steblynskyi.com"]
    max_age_seconds = "0"
  }
}

#ACL Policy
resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id
  acl    = var.acl
}