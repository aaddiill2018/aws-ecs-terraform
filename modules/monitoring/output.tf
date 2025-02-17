output "cloudwatch_log_group_name" {
  description = "Name of the CloudWatch log group"
  value       = aws_cloudwatch_log_group.ajalah_prod_log_group.name
}

output "cloudwatch_log_stream_name" {
  description = "Name of the CloudWatch log stream"
  value       = aws_cloudwatch_log_stream.ajalah_prod_log_stream.name
}

output "sns_topic_arn" {
  description = "ARN of the SNS topic"
  value       = aws_sns_topic.ajalah_prod_sns_topic.arn
}

output "xray_sampling_rule_arn" {
  description = "ARN of the X-Ray sampling rule"
  value       = aws_xray_sampling_rule.ajalah_prod_sampling_rule.arn
}
