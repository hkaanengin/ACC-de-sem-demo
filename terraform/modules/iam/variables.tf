variable "glue_role_name" {
  description = "Name of the IAM role for Glue"
  type        = string
}

variable "source_bucket_arn" {
  description = "ARN of the source S3 bucket"
  type        = string
}

variable "target_bucket_arn" {
  description = "ARN of the target S3 bucket"
  type        = string
}

variable "source_athena_workgroup_arn" {
  description = "ARN of the source Athena workgroup"
  type        = string
}

variable "target_athena_workgroup_arn" {
  description = "ARN of the target Athena workgroup"
  type        = string
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}