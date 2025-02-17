resource "aws_s3_bucket" "ajalah_prod_img_uploads" {
  bucket = "ajalah-prod-img-uploads"
  acl    = "private"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "ajalah-prod-img-uploads"
  }
}

resource "aws_s3_bucket" "ajalah_prod_img_uploads_resized" {
  bucket = "ajalah-prod-img-uploads-resized"
  acl    = "private"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "ajalah-prod-img-uploads-resized"
  }
}

resource "aws_ecr_repository" "ajalah_prod_container_registry" {
  name                 = "ajalah-prod-container-repository"
  image_tag_mutability = "MUTABLE"

  tags = {
    Name = "ajalah-prod-container-repository"
  }
}

resource "aws_dynamodb_table" "ajalah_prod_dynamo_table" {
  name           = "ajalah-prod-dynamo-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"
  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Name = "ajalah-prod-dynamo-table"
  }
}

resource "aws_dynamodb_table" "ajalah_prod_dynamo_streams" {
  name           = "ajalah-prod-dynamo-streams"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"
  attribute {
    name = "id"
    type = "S"
  }

  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES" # Can be one of "NEW_IMAGE", "OLD_IMAGE", "NEW_AND_OLD_IMAGES"

  tags = {
    Name = "ajalah-prod-dynamo-streams"
  }
}
