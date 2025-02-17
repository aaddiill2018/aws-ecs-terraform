variable "s3_bucket_name_img_uploads" {
  description = "The name of the S3 bucket for image uploads"
  type        = string
}

variable "s3_bucket_name_img_uploads_resized" {
  description = "The name of the S3 bucket for resized image uploads"
  type        = string
}

variable "ecr_repository_name" {
  description = "The name of the ECR repository"
  type        = string
}

variable "dynamo_table_name" {
  description = "The name of the DynamoDB table"
  type        = string
}

variable "dynamo_streams_table_name" {
  description = "The name of the DynamoDB table with streams enabled"
  type        = string
}
