# General
variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
}

# S3
variable "data_bucket_name" {
  description = "Name of the S3 bucket for semantic layer data"
  type        = string
}

# Athena
variable "database_name" {
  description = "Name of the Athena database for semantic layer"
  type        = string
}

variable "workgroup_name" {
  description = "Name of the Athena workgroup for semantic layer"
  type        = string
}

# IAM
variable "glue_role_name" {
  description = "Name of the IAM role for Glue"
  type        = string
}

variable "source_bucket_arn" {
  description = "ARN of the source S3 bucket"
  type        = string
}

variable "source_athena_workgroup_arn" {
  description = "ARN of the source Athena workgroup"
  type        = string
}

# Glue
variable "glue_job_name" {
  description = "Name of the Glue ETL job"
  type        = string
}

variable "script_bucket" {
  description = "S3 bucket containing Glue scripts"
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

variable "glue_worker_type" {
  description = "Type of Glue worker"
  type        = string
  default     = "G.1X"
}

variable "glue_workers_count" {
  description = "Number of Glue workers"
  type        = number
  default     = 2
}

variable "enable_job_schedule" {
  description = "Whether to enable job scheduling"
  type        = bool
  default     = false
}

variable "job_schedule" {
  description = "Cron expression for job schedule"
  type        = string
  default     = "cron(0 0 * * ? *)"
}
