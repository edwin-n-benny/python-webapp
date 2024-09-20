terraform {
  backend "s3" {
    bucket = "eb-terraform-statefile"
    key    = "elastic-beanstalk/terraform.tfstate"
    region = "ap-southeast-2"
  }
}
