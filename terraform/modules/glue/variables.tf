variable "job_name" {
  description = "Name of the Glue job"
  type        = string
}

variable "glue_role_arn" {
  description = "ARN of the IAM role for Glue"
  type        = string
}

variable "script_bucket" {
  description = "S3 bucket containing the Glue script"
  type        = string
}

variable "script_key" {
  description = "S3 key for the Glue script"
  type        = string
}

variable "source_database" {
  description = "Name of the source Athena database"
  type        = string
}

variable "target_database" {
  description = "Name of the target Athena database"
  type        = string
}

variable "extra_py_files" {
  description = "Additional Python files for the job"
  type        = string
  default     = ""
}

variable "worker_type" {
  description = "Type of worker to use (G.1X, G.2X, Standard)"
  type        = string
  default     = "G.1X"
}

variable "number_of_workers" {
  description = "Number of workers to use"
  type        = number
  default     = 2
}

variable "timeout" {
  description = "Job timeout in minutes"
  type        = number
  default     = 60
}

variable "max_concurrent_runs" {
  description = "Maximum number of concurrent job runs"
  type        = number
  default     = 1
}

variable "enable_schedule" {
  description = "Whether to enable scheduled trigger"
  type        = bool
  default     = false
}

variable "schedule_expression" {
  description = "Cron expression for job schedule"
  type        = string
  default     = "cron(0 0 * * ? *)"  # Daily at midnight UTC
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
}

# modules/glue/outputs.tf
output "job_name" {
  description = "Name of the created Glue job"
  value       = aws_glue_job.semantic_etl.name
}

output "job_arn" {
  description = "ARN of the created Glue job"
  value       = aws_glue_job.semantic_etl.arn
}