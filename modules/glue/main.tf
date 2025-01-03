resource "aws_glue_job" "semantic_etl" {
  name         = var.job_name
  role_arn     = var.glue_role_arn
  glue_version = "3.0"  # Supports the latest PySpark
  
  command {
    script_location = "s3://${var.script_bucket}/${var.script_key}"
    python_version  = "3"
  }

  default_arguments = {
    "--job-language"                     = "python"
    "--continuous-log-logGroup"          = "/aws-glue/jobs/${var.job_name}"
    "--enable-continuous-cloudwatch-log" = "true"
    "--enable-metrics"                   = "true"
    "--enable-spark-ui"                  = "true"
    "--spark-event-logs-path"           = "s3://${var.script_bucket}/spark-logs/"
    "--source-database"                  = var.source_database
    "--target-database"                  = var.target_database
    "--TempDir"                         = "s3://${var.script_bucket}/temporary/"
    "--extra-py-files"                  = var.extra_py_files
    "--conf"                            = "spark.sql.legacy.timeParserPolicy=LEGACY"
  }

  execution_property {
    max_concurrent_runs = var.max_concurrent_runs
  }

  worker_type       = var.worker_type
  number_of_workers = var.number_of_workers
  timeout          = var.timeout

  tags = {
    Environment = var.environment
    Layer       = "Semantic"
  }
}

resource "aws_glue_trigger" "semantic_etl_schedule" {
  count = var.enable_schedule ? 1 : 0
  
  name          = "${var.job_name}-trigger"
  type          = "SCHEDULED"
  schedule      = var.schedule_expression

  actions {
    job_name = aws_glue_job.semantic_etl.name
  }

  tags = {
    Environment = var.environment
    Layer       = "Semantic"
  }
}