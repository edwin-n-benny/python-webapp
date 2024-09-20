# Referencing the existing S3 bucket
data "aws_s3_bucket" "existing_bucket" {
  bucket = "eb-terraform-statefile"
}

