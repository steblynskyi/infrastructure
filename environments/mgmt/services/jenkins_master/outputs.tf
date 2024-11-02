output "ELB_External_Name" {
  value = aws_elb.jenkins_external.dns_name
}

output "Internal_Domain" {
  value = aws_route53_record.cname_jenkins_internal.name
}