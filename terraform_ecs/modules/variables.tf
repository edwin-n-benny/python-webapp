# variables.tf

# AWS region
variable "aws_region" {
  description = "The AWS region to deploy resources into"
  default     = "ap-southeast-2"
}

# VPC Variables
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "14.0.0.0/16"  # You can set a default value or leave it unset
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
}

# IAM Variables
variable "ecs_task_execution_role_name" {
  description = "Name for the ECS task execution role"
  default     = "eb-tf-ecsTaskExecutionRole"
}

variable "ecs_task_role_name" {
  description = "Name for the ECS task role"
  default = "eb-tf-ecsTaskRole"
}

# Security Groups Variables
variable "allowed_ports" {
  description = "List of allowed inbound ports for the security group"
  default     = [80, 443] # HTTP and HTTPS
}

# ECS Variables
variable "cluster_name" {
  description = "Name of the ECS cluster"
  default     = "eb-tf-my-ecs-cluster"
}

variable "task_cpu" {
  description = "CPU units for the ECS task"
  default     = "256"
}

variable "task_memory" {
  description = "Memory for the ECS task in MiB"
  default     = "512"
}

variable "container_name" {
  description = "Name of the container"
  default     = "eb-tf-my-app"
}

variable "container_image" {
  description = "Docker image for the container"
  default     = "nginx:latest" # Placeholder, should be replaced with your app's image
}

variable "container_cpu" {
  description = "CPU units for the container"
  default     = 256
}

variable "container_memory" {
  description = "Memory for the container in MiB"
  default     = 512
}

variable "container_port" {
  description = "Port the container listens on"
  default     = 80
}

# ECR Variables
variable "ecr_repo_name" {
  description = "Name of the ECR repository"
  default     = "eb-tf-my-python-app-repo"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ECS tasks"
  default     = [] # Must be populated via tfvars or directly in the configuration
}

variable "security_group_id" {
  description = "Security Group ID to be used by ECS tasks"
  default     = "" # Will be set by the module outputs, typically not set manually
}

variable "network_mode" {
  description = "The network mode for the ECS task (e.g., 'awsvpc')"
  default     = "awsvpc"
}

variable "requires_compatibilities" {
  description = "Specifies the launch type required by the task (e.g., 'FARGATE')"
  default     = ["FARGATE"]
}

# IAM Role ARNs
variable "execution_role_arn" {
  description = "IAM Role ARN for ECS task execution"
  default     = "" # Will be set by the IAM module outputs
}

variable "ecs_execution_role_arn" {
  description = "IAM Role ARN for ECS task execution"
  default     = ""
}

variable "task_role_arn" {
  description = "IAM Role ARN for ECS tasks"
  default     = "" # Will be set by the IAM module outputs
}

# VPC ID
variable "vpc_id" {
  description = "The ID of the VPC where resources will be deployed"
  default     = "" # Will be set by the VPC module outputs
}

variable "ecr_repository_url" {
  description = "URL for the ECR repository"
  default     = "" # Will be set by the VPC module outputs
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)  # This specifies that the variable should be a list of strings
  default = [ "" ]
}

variable "availability_zones" {
  description = "List of availability zones to use for the subnets"
  type        = list(string)
  default     = ["ap-southeast-2a", "ap-southeast-2b"]  # You can specify default values or leave it empty
}

variable "log_group_name" {
  description = "The name of the CloudWatch Logs group."
  type        = string
  default = "eb-tf-cloudwatch-log-group"
}

variable "log_stream_prefix" {
  description = "The prefix for the CloudWatch Logs stream."
  type        = string
  default = "ecs"
}
