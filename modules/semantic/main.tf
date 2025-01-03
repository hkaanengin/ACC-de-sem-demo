module "s3" {
  source = "../s3"
  
  bucket_name = var.data_bucket_name
  environment = var.environment
}

module "athena" {
  source = "../athena"
  
  database_name  = var.database_name
  workgroup_name = var.workgroup_name
  output_bucket  = module.s3.bucket_id
  environment    = var.environment
}

module "iam" {
  source = "../iam"
  
  glue_role_name             = var.glue_role_name
  source_bucket_arn          = var.source_bucket_arn
  target_bucket_arn          = module.s3.bucket_arn
  source_athena_workgroup_arn = var.source_athena_workgroup_arn
  target_athena_workgroup_arn = module.athena.workgroup_arn
  environment                = var.environment
}

module "glue" {
  source = "../glue"
  
  job_name            = var.glue_job_name
  glue_role_arn       = module.iam.glue_role_arn
  script_bucket       = var.script_bucket
  script_key          = var.script_key
  source_database     = var.source_database
  target_database     = module.athena.database_name
  worker_type         = var.glue_worker_type
  number_of_workers   = var.glue_workers_count
  enable_schedule     = var.enable_job_schedule
  schedule_expression = var.job_schedule
  environment         = var.environment
}
