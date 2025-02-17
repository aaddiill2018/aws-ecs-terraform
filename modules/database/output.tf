# Outputs for the database resources

output "redis_endpoint" {
  description = "ElastiCache Redis endpoint"
  value       = aws_elasticache_cluster.ajalah_prod_redis.endpoint
}

output "opensearch_endpoint" {
  description = "OpenSearch domain endpoint"
  value       = aws_opensearch_domain.ajalah_prod_opensearch.endpoint
}

output "dynamodb_table_name" {
  description = "DynamoDB table name with streams enabled"
  value       = aws_dynamodb_table.ajalah_prod_dynamo_streams.name
}
