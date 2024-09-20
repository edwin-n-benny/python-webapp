terraform {
  backend "s3" {
    bucket = "eb-terraform-statefile"
    key    = "elastic-beanstalk/terraform.tfstate"
    region = "ap-southeast-2"
    # dynamodb_table = "eb-tf-state-lock" # Optional for state locking
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
