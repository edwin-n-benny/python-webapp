# terraform.tfvars

aws_region           = "ap-southeast-2"
vpc_cidr             = "14.0.0.0/16"
public_subnet_cidrs  = ["14.0.0.0/24", "14.0.128.0/24"]
ecs_task_execution_role_name = "eb-tf-ecsTaskExecutionRole"
ecs_task_role_name = "eb-tf-ecsTaskRole"
allowed_ports        = [80, 443, 22, 5000]
availability_zones    = ["ap-southeast-2a", "ap-southeast-2b"]

cluster_name         = "my-ecs-cluster"
task_cpu             = "256"
task_memory          = "512"
container_name       = "eb-tf-my-python-webapp"
container_image      = "eb-tf-my-python-app-repo:latest" # Replace with the correct image tag
container_cpu        = 256
container_memory     = 512
container_port       = 5000

ecr_repo_name        = "eb-tf-my-python-app-repo"

network_mode             = "awsvpc"
requires_compatibilities = ["FARGATE"]

log_group_name        = "eb-tf-cloudwatch-log-group"
log_stream_prefix = "ecs"

# No need to manually set these unless custom IAM roles are pre-created:
# execution_role_arn      = "arn:aws:iam::123456789012:role/ecsTaskExecutionRole"
# task_role_arn           = "arn:aws:iam::123456789012:role/ecsTaskRole"