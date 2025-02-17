provider "aws" {
  region = var.aws_region
}

resource "aws_cloudwatch_log_group" "ajalah_prod_log_group" {
  name              = "/aws/lambda/ajalah-prod-logs"
  retention_in_days = 30
  tags = {
    Name = "ajalah-prod-log-group"
  }
}

resource "aws_cloudwatch_log_stream" "ajalah_prod_log_stream" {
  name              = "ajalah-prod-log-stream"
  log_group_name    = aws_cloudwatch_log_group.ajalah_prod_log_group.name
}

resource "aws_xray_sampling_rule" "ajalah_prod_sampling_rule" {
  rule_name      = "ajalah-prod-rule"
  priority       = 1
  fixed_rate     = 0.05
  reservoir_size = 1
  service_name   = "ajalah-prod-service"
  service_type   = "*"
  resource_arn   = "*"
  host           = "*"
  http_method    = "*"
  url_path       = "/"
  version        = 1
}

resource "aws_sns_topic" "ajalah_prod_sns_topic" {
  name = "ajalah-prod-sns-topic"

  tags = {
    Name = "ajalah-prod-sns-topic"
  }
}

resource "aws_sns_topic_subscription" "ajalah_prod_sns_sub" {
  topic_arn = aws_sns_topic.ajalah_prod_sns_topic.arn
  protocol  = "email"
  endpoint  = var.sns_email_endpoint
}
