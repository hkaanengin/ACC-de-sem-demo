variable "database_name" {
  description = "Name of the Athena database"
  type        = string
}

variable "workgroup_name" {
  description = "Name of the Athena workgroup"
  type        = string
}

variable "output_bucket" {
  description = "S3 bucket for Athena query results"
  type        = string
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}