aws_region = "eu-west-1"
environment = "dev"
semantic_bucket_name = "your-semantic-layer-bucket"
semantic_database_name = "semantic_db"
semantic_workgroup_name = "semantic_workgroup"
glue_role_name = "semantic_glue_role"
source_bucket_arn = "arn:aws:s3:::your-source-bucket"
source_athena_workgroup_arn = "arn:aws:athena:us-west-2:123456789012:workgroup/source-workgroup"

glue_job_name = "dev-semantic-etl"
script_bucket = "dev-glue-scripts"
script_key = "semantic/etl_job.py"
source_database = "dev_source_db"
glue_worker_type = "G.1X"
glue_workers_count = 2
enable_job_schedule = true
job_schedule = "cron(0 0 * * ? *)"