output "ASG_Name" {
  value = aws_autoscaling_group.asg.name
}

output "ALB_Name" {
  value = aws_lb.alb.dns_name
}
