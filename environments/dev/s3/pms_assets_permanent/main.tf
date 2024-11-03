# Config of S3 Bucket
resource "aws_s3_bucket" "this" {
  bucket = var.s3_name

  tags = {
    VPC-ID      = var.vpc_id
    Environment = var.environment
    Terraform   = var.terraform
  }
}

# Attach policy to S3 bucket
resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id
  policy = file("policy.json")
}

#ACL Policy
resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id
  acl    = var.acl
}