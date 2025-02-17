output "s3_bucket_img_uploads" {
  description = "The name of the S3 bucket for image uploads"
  value       = aws_s3_bucket.ajalah_prod_img_uploads.bucket
}

output "s3_bucket_img_uploads_resized" {
  description = "The name of the S3 bucket for resized image uploads"
  value       = aws_s3_bucket.ajalah_prod_img_uploads_resized.bucket
}

output "ecr_repository_url" {
  description = "The URL of the ECR repository"
  value       = aws_ecr_repository.ajalah_prod_container_registry.repository_url
}

output "dynamo_table_name" {
  description = "The name of the DynamoDB table"
  value       = aws_dynamodb_table.ajalah_prod_dynamo_table.name
}

output "dynamo_streams_table_name" {
  description = "The name of the DynamoDB streams table"
  value       = aws_dynamodb_table.ajalah_prod_dynamo_streams.name
}
