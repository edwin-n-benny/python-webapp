resource "aws_elastic_beanstalk_application" "eb_app" {
  name        = var.eb_app_name
  description = "Terraform-managed Elastic Beanstalk application"
}
