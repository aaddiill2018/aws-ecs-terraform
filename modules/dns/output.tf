output "hosted_zone_id" {
  description = "The ID of the Route 53 Hosted Zone"
  value       = aws_route53_zone.ajalah_zone.zone_id
}

output "certificate_arn" {
  description = "The ARN of the ACM SSL Certificate"
  value       = aws_acm_certificate.ajalah_cert.arn
}
