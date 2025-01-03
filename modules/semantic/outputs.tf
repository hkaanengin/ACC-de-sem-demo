output "bucket_id" {
  description = "ID of the semantic S3 bucket"
  value       = module.s3.bucket_id
}

output "bucket_arn" {
  description = "ARN of the semantic S3 bucket"
  value       = module.s3.bucket_arn
}

output "database_name" {
  description = "Name of the Athena database"
  value       = module.athena.database_name
}

output "workgroup_arn" {
  description = "ARN of the Athena workgroup"
  value       = module.athena.workgroup_arn
}

output "glue_role_arn" {
  description = "ARN of the Glue IAM role"
  value       = module.iam.glue_role_arn
}
