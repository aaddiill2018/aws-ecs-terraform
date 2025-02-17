output "amplify_app_id" {
  description = "The ID of the AWS Amplify application"
  value       = aws_amplify_app.ajalah_app.id
}

output "amplify_app_url" {
  description = "The default AWS Amplify application URL"
  value       = aws_amplify_app.ajalah_app.default_domain
}
