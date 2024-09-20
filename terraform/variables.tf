variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "ap-southeast-2"
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket for Terraform state"
  type        = string
  default     = "eb-terraform-statefile"
}

variable "eb_app_name" {
  description = "Elastic Beanstalk application name"
  default     = "tf-eb-app"
}

variable "eb_env_name" {
  description = "Elastic Beanstalk environment name"
  default     = "tf-eb-env"
}

variable "eb_solution_stack" {
  description = "Elastic Beanstalk solution stack name"
  default     = "64bit Amazon Linux 2023 v4.3.6 running Docker"
}

variable "instance_type" {
  description = "EC2 instance type for Elastic Beanstalk"
  default     = "t2.micro"
}
