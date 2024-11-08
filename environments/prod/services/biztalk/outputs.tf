output "ALB_Name" {
  value = aws_lb.alb.dns_name
}

output "Domain" {
  value = aws_route53_record.cname_route53_record.name
}

output "Target_Group_Main_ARN" {
  value = aws_lb_target_group.alb_target_group.arn
}

output "Target_Group_OTA_Public_ARN" {
  value = aws_alb_target_group.ota_public_api_tg.arn
}
