# IAM Role for ECS Task Execution
resource "aws_iam_role" "ecs_task_execution_role" {
  name = var.ecs_task_execution_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })

  tags = {
    Name = "ecs-task-execution-role"
  }
}

# Attach AmazonECSTaskExecutionRolePolicy to the ECS Task Execution Role
resource "aws_iam_policy_attachment" "ecs-task-execution-role-policy-attachment" {
  name       = "ecs-task-execution-policy-attach"
  roles      = [aws_iam_role.ecs_task_execution_role.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# IAM Role for ECS Task
resource "aws_iam_role" "ecs_task_role" {
  name = var.ecs_task_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })

  tags = {
    Name = "ecs-task-role"
  }
}

# Attach additional policies to the ECS Task Role
resource "aws_iam_policy" "ecs_task_policy" {
  name        = "ecsTaskPolicy"
  description = "Policy for ECS task to access required resources"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:ListBucket",
          "dynamodb:Query",
          "dynamodb:Scan"
        ]
        Resource = [
          "arn:aws:s3:::your-bucket-name",
          "arn:aws:s3:::your-bucket-name/*",
          "arn:aws:dynamodb:your-region:your-account-id:table/your-table-name"
        ]
      },
      {
        Effect = "Allow"
        Action = "logs:*"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "ecs_task_policy_attachment" {
  name       = "ecs-task-policy-attach"
  roles      = [aws_iam_role.ecs_task_role.name]
  policy_arn = aws_iam_policy.ecs_task_policy.arn
}
