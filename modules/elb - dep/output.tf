output "elb_arn" {
  value = aws_lb.this.arn
}

output "elb_dns_name" {
  value = aws_lb.this.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.this.arn
}
