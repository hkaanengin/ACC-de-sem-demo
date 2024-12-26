variable "bucket_name" {
  description = "Name of the S3 bucket for semantic layer"
  type        = string
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}