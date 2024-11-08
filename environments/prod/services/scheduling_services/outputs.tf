output "EC2" {
  value = aws_instance.scheduling_services.*.id
}

output "ELB" {
  value = aws_elb.elb.dns_name
}

output "Domain" {
  value = aws_route53_record.cname_route53_record.name
}