output "database_name" {
  description = "Name of the created Athena database"
  value       = aws_athena_database.semantic_db.name
}

output "workgroup_arn" {
  description = "ARN of the created Athena workgroup"
  value       = aws_athena_workgroup.semantic_workgroup.arn
}