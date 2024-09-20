output "eb_app_name" {
  description = "The name of the Elastic Beanstalk application"
  value       = aws_elastic_beanstalk_application.eb_app.name
}

output "eb_env_name" {
  description = "The name of the Elastic Beanstalk environment"
  value       = aws_elastic_beanstalk_environment.eb_env.name
}

output "s3_bucket_name" {
  description = "The name of the S3 bucket storing application versions"
  value       = data.aws_s3_bucket.existing_bucket.bucket
}

