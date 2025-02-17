# ElastiCache (Redis)
resource "aws_elasticache_cluster" "ajalah_prod_redis" {
  cluster_id           = "ajalah-prod-redis"
  engine               = "redis"
  node_type            = "cache.t3.medium"
  num_cache_nodes      = 1
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.ajalah_prod_subnet_group.name
  security_group_ids  = [aws_security_group.ajalah_prod_db_sg.id]
  tags = {
    Name = "ajalah-prod-redis"
  }
}

# OpenSearch
resource "aws_opensearch_domain" "ajalah_prod_opensearch" {
  domain_name            = "ajalah-prod-opensearch"
  engine_version         = "7.9"  # Corrected attribute, use engine_version instead of elasticsearch_version
  cluster_config {
    instance_type = "t3.small.search"
    instance_count = 2
  }
  ebs_options {
    ebs_enabled = true
    volume_type = "gp2"
    volume_size = 20
  }
  advanced_security_options {
    enabled = true
  }
  tags = {
    Name = "ajalah-prod-opensearch"
  }
}


# DynamoDB Table for Streams
resource "aws_dynamodb_table" "ajalah_prod_dynamo_streams" {
  name           = "ajalah-prod-dynamo-streams"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"
  attribute {
    name = "id"
    type = "S"
  }

  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  tags = {
    Name = "ajalah-prod-dynamo-streams"
  }
}
