resource "aws_cloudwatch_log_group" "ecs_logs" {
  name = var.log_group_name

  retention_in_days = 7  # Adjust retention as needed

  tags = {
    Name = "ecs-log-group"
  }
}

# Optionally define a log stream prefix if needed
resource "aws_cloudwatch_log_stream" "ecs_log_stream" {
  name           = "${var.log_group_name}/${var.log_stream_prefix}"
  log_group_name = aws_cloudwatch_log_group.ecs_logs.name
}
