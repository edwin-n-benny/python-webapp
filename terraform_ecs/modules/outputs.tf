# outputs.tf
output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value = aws_subnet.public[*].id
}


output "ecs_cluster_id" {
  description = "ECS Cluster ID"
  value       = aws_ecs_cluster.main.id
}

output "ecs_service_name" {
  description = "ECS Service Name"
  value       = aws_ecs_service.web_service.name
}

output "ecr_repository_url" {
  value = aws_ecr_repository.app_repo.repository_url
}

output "ecs_execution_role_arn" {
  value = aws_iam_role.ecs_task_execution_role.arn
}

output "ecs_task_role_arn" {
  value = aws_iam_role.ecs_task_role.arn
}

output "security_group_id" {
  value = aws_security_group.ecs_service_sg.id
}