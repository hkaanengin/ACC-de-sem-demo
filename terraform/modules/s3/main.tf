resource "aws_s3_bucket" "semantic_layer" {
  bucket = var.bucket_name
  
  tags = {
    Environment = var.environment
    Layer       = "Semantic"
  }
}

resource "aws_s3_bucket_versioning" "semantic_versioning" {
  bucket = aws_s3_bucket.semantic_layer.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "semantic_encryption" {
  bucket = aws_s3_bucket.semantic_layer.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}