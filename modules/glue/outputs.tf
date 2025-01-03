output "job_name" {
  description = "Name of the created Glue job"
  value       = aws_glue_job.semantic_etl.name
}

output "job_arn" {
  description = "ARN of the created Glue job"
  value       = aws_glue_job.semantic_etl.arn
}