output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.ajalah_prod_sg.id
}

output "iam_role_arn" {
  description = "ARN of the IAM role for ECS"
  value       = aws_iam_role.ajalah_prod_ecs_role.arn
}

output "kms_key_id" {
  description = "ID of the KMS key"
  value       = aws_kms_key.ajalah_prod_kms.id
}

output "secret_arn" {
  description = "ARN of the Secrets Manager secret"
  value       = aws_secretsmanager_secret.ajalah_prod_db_password.arn
}
