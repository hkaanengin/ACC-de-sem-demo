resource "aws_athena_database" "semantic_db" {
  name   = var.database_name
  bucket = var.output_bucket
}

resource "aws_athena_workgroup" "semantic_workgroup" {
  name = var.workgroup_name

  configuration {
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = true

    result_configuration {
      output_location = "s3://${var.output_bucket}/athena-results/"
      
      encryption_configuration {
        encryption_option = "SSE_S3"
      }
    }
  }

  tags = {
    Environment = var.environment
    Layer       = "Semantic"
  }
}
