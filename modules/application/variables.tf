variable "lambda_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "ajalah-prod-lambda"
}

variable "lambda_package" {
  description = "Path to the Lambda deployment package"
  type        = string
  default     = "lambda.zip"
}

variable "event_rule_name" {
  description = "Name of the EventBridge rule"
  type        = string
  default     = "ajalah-prod-event-rule"
}

variable "sqs_queue_name" {
  description = "Name of the SQS Queue"
  type        = string
  default     = "ajalah-prod-sqs"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "production"
}
