# Load Balancer
output "lb_dns_name" {
  value = aws_lb.kafka-proxy.dns_name
}

output "domain_name" {
  value = aws_route53_record.kafka-proxy.name
}

output "target_group_0_arn" {
  value = aws_lb_target_group.kraft-0-external.arn
}

output "target_group_1_arn" {
  value = aws_lb_target_group.kraft-1-external.arn
}

output "target_group_2_arn" {
  value = aws_lb_target_group.kraft-2-external.arn
}

output "target_group_3_arn" {
  value = aws_lb_target_group.kraft-3-external.arn
}

output "target_group_4_arn" {
  value = aws_lb_target_group.kraft-4-external.arn
}

output "message" {
  value = "Make Sure TG has binding enable in Kubernetes"
}