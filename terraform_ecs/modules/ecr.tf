# ecr.tf
resource "aws_ecr_repository" "app_repo" {
  name = var.ecr_repo_name

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = var.ecr_repo_name
  }
}
