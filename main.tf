provider "aws" {
  region = var.aws_region
}

module "semantic" {
  source = "./modules/semantic"

  # General
  environment = var.environment
  project     = var.project_name

  # S3
  data_bucket_name = "${var.project_name}-${var.environment}-data"
  
  # Athena
  database_name  = "${var.project_name}_${var.environment}_semantic"
  workgroup_name = "${var.project_name}-${var.environment}-workgroup"
  
  # IAM
  glue_role_name = "${var.project_name}-${var.environment}-glue-role"
  source_bucket_arn = var.source_bucket_arn
  source_athena_workgroup_arn = var.source_athena_workgroup_arn
  
  # Glue
  glue_job_name = "${var.project_name}-${var.environment}-etl"
  script_bucket = var.script_bucket
  script_key    = var.script_key
  source_database = var.source_database
  glue_worker_type = var.glue_worker_type
  glue_workers_count = var.glue_workers_count
  enable_job_schedule = var.enable_job_schedule
  job_schedule = var.job_schedule
}