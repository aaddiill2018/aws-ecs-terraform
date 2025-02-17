resource "aws_lambda_function" "ajalah_lambda" {
  function_name    = var.lambda_name
  role            = aws_iam_role.lambda_role.arn
  handler         = "index.handler"
  runtime         = "python3.9"
  filename        = var.lambda_package

  environment {
    variables = {
      ENV = var.environment
    }
  }

  tags = {
    Name = var.lambda_name
  }
}

resource "aws_iam_role" "lambda_role" {
  name = "ajalah_lambda_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_lambda_permission" "eventbridge_permission" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.ajalah_lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.ajalah_event_rule.arn
}

resource "aws_cloudwatch_event_rule" "ajalah_event_rule" {
  name        = var.event_rule_name
  description = "EventBridge rule for Lambda trigger"
  schedule_expression = "rate(5 minutes)" # Adjust as needed
}

resource "aws_cloudwatch_event_target" "ajalah_event_target" {
  rule      = aws_cloudwatch_event_rule.ajalah_event_rule.name
  arn       = aws_lambda_function.ajalah_lambda.arn
}

resource "aws_sqs_queue" "ajalah_sqs" {
  name = var.sqs_queue_name
}

resource "aws_lambda_event_source_mapping" "sqs_trigger" {
  event_source_arn = aws_sqs_queue.ajalah_sqs.arn
  function_name    = aws_lambda_function.ajalah_lambda.arn
  batch_size       = 10
}
