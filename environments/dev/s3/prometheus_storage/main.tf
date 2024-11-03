# Config of S3 Bucket
resource "aws_s3_bucket" "this" {
  bucket = var.s3_name

  tags = {
    Environment = var.environment
    Terraform   = "True"
  }
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.bucket
  acl    = "private"
}