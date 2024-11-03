output "ELB" {
  value = aws_elb.elb.dns_name
}

output "ASG" {
  value = aws_autoscaling_group.scheduling_service.name
}

output "Domain" {
  value = aws_route53_record.cname_route53_record.name
}