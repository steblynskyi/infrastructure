output "ASG_Name" {
  value = aws_autoscaling_group.asg.name
}

output "ALB_Name" {
  value = aws_lb.alb.dns_name
}

output "Domain" {
  value = aws_route53_record.cname_route53_record.name
}