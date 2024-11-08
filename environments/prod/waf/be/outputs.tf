output "NBE-WAF" {
  value = aws_wafv2_web_acl.nbe.arn
}

output "NBE-IP-Block" {
  value = aws_wafv2_ip_set.nbe-ip-block.arn
}