variable "app_name" {
  description = "Name of the AWS Amplify application"
  type        = string
  default     = "ajalah-amplify-app"
}

variable "repository_url" {
  description = "GitHub repository URL for Amplify App"
  type        = string
}

variable "iam_role_arn" {
  description = "IAM Role ARN for Amplify"
  type        = string
}

variable "domain_name" {
  description = "Custom domain for Amplify"
  type        = string
}
