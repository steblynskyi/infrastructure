# Config of S3 Bucket
resource "aws_s3_bucket" "this" {
  bucket = var.s3_name

  tags = {
    VPC-ID      = var.vpc_id
    Environment = var.environment
    Terraform   = var.terraform
  }
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.bucket
  acl    = "private"
}