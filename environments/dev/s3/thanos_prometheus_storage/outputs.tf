output "Bucket_ARN" {
  value = aws_s3_bucket.this.arn
}

output "Bucket_Name" {
  value = aws_s3_bucket.this.bucket_domain_name
}

