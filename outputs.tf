output "semantic_bucket_arn" {
  description = "ARN of the semantic layer S3 bucket"
  value       = module.s3.bucket_arn
}

output "semantic_database_name" {
  description = "Name of the semantic layer Athena database"
  value       = module.athena.database_name
}

output "glue_role_arn" {
  description = "ARN of the IAM role for Glue"
  value       = module.iam.glue_role_arn
}