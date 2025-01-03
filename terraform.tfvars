aws_region = "eu-west-1"
environment = "dev"
project_name = "semantic"

# Source resources
source_bucket_arn = "arn:aws:s3:::source-bucket"
source_athena_workgroup_arn = "arn:aws:athena:eu-west-1:123456789012:workgroup/source-workgroup"
source_database = "source_db"

# Glue configuration
script_bucket = "glue-scripts"
script_key = "etl/semantic_job.py"
glue_worker_type = "G.1X"
glue_workers_count = 2
enable_job_schedule = true
job_schedule = "cron(0 0 * * ? *)"