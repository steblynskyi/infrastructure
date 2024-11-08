output "EC2_ID" {
  value = aws_instance.biztalk_sql.id
}

output "Volume_1" {
  value = aws_ebs_volume.this_1.id
}

output "Volume_2" {
  value = aws_ebs_volume.this_2.id
}

output "Volume_3" {
  value = aws_ebs_volume.this_3.id
}

output "Volume_4" {
  value = aws_ebs_volume.this_4.id
}

output "domain" {
  value = aws_route53_record.cname_route53_record.name
}