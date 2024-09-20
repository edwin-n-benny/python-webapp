provider "aws" {
  region = var.aws_region
}

module "eb_project" {
  source                       = "../modules"

  # VPC Module
  vpc_id                       = var.vpc_id
  vpc_cidr                     = var.vpc_cidr
  public_subnet_cidrs          = var.public_subnet_cidrs
  public_subnet_ids            = var.public_subnet_ids
  availability_zones           = var.availability_zones

  # Security-groups Module
  security_group_id            = var.security_group_id

  # IAM Module
  execution_role_arn           = var.ecs_execution_role_arn
  task_role_arn                = var.task_role_arn

  # Cloudwatch Logs Module
  aws_region = var.aws_region
  log_group_name = var.log_group_name
  log_stream_prefix = var.log_stream_prefix

  # ECR Module
  ecr_repo_name                = var.ecr_repo_name

  # ECS Module
  ecs_task_execution_role_name = var.ecs_task_execution_role_name
  cluster_name                 = var.cluster_name
  network_mode                 = var.network_mode
  requires_compatibilities     = var.requires_compatibilities
  task_cpu                     = var.task_cpu
  task_memory                  = var.task_memory
  container_name               = var.container_name
  container_image              = var.container_image
  container_cpu                = var.container_cpu
  container_memory             = var.container_memory
  container_port               = var.container_port
  subnet_ids                   = var.public_subnet_ids
}

# Automate Docker image build and push
# resource "null_resource" "docker_image_build_and_push" {
#   provisioner "local-exec" {
#     command = <<EOT
#       aws ecr get-login-password --region ${var.aws_region} | docker login --username AWS --password-stdin ${var.ecr_repository_url}
#       docker build -t ${var.ecr_repository_url}:latest .
#       docker push ${var.ecr_repository_url}:latest
#     EOT
#   }
# }