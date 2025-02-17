output "lambda_arn" {
  description = "The ARN of the Lambda function"
  value       = aws_lambda_function.ajalah_lambda.arn
}

output "event_rule_arn" {
  description = "The ARN of the EventBridge rule"
  value       = aws_cloudwatch_event_rule.ajalah_event_rule.arn
}

output "sqs_queue_arn" {
  description = "The ARN of the SQS queue"
  value       = aws_sqs_queue.ajalah_sqs.arn
}
