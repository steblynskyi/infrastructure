# Config of S3 Bucket
resource "aws_s3_bucket" "this" {
  bucket = var.s3_name

  tags = {
    VPC-ID      = var.vpc_id
    Environment = var.environment
    Terraform   = var.terraform
  }
}

#Cors Configuration
resource "aws_s3_bucket_cors_configuration" "this" {
  bucket = aws_s3_bucket.this.id
  cors_rule {
    allowed_origins = ["https://*.dev-steblynskyi.com", "http://*.dev-steblynskyi.com"]
    allowed_methods = ["POST", "GET", "PUT", "DELETE"]
    allowed_headers = ["*"]
    max_age_seconds = "0"
  }
}

# Attach policy to S3 bucket
resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id
  policy = file("bucket-policy.json")
}

#ACL Policy
resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id
  acl    = var.acl
}