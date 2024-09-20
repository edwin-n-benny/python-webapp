resource "aws_elastic_beanstalk_environment" "eb_env" {
  name                = var.eb_env_name
  application         = aws_elastic_beanstalk_application.eb_app.name
  solution_stack_name = var.eb_solution_stack

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "LoadBalanced"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = "arn:aws:iam::866934333672:role/eb-docker-application-beanstalk"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "EC2KeyName"
    value     = "eb-keypair"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "arn:aws:iam::866934333672:instance-profile/aws-elasticbeanstalk-ec2-role"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = "vpc-0ef03f4b2ffc4f0c6"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "subnet-0865dc625947c97a0,subnet-0157d4a460e90f188"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "AssociatePublicIpAddress"
    value     = "true"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    value     = "sg-05e95fb393fc8c2ec"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = "1"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = "2"
  }

  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "MeasureName"
    value     = "CPUUtilization"
  }

  # setting {
  #   namespace = "aws:elb:loadbalancer"
  #   name      = "Listeners"
  #   value     = "Protocol=HTTP,Port=80,InstanceProtocol=HTTP,InstancePort=5000"
  # }

  # setting {
  #   namespace = "aws:elb:loadbalancer"
  #   name      = "HealthCheck"
  #   value     = "Target=HTTP:5000/,Interval=30,Timeout=5,HealthyThreshold=3,UnhealthyThreshold=3"
  # }

}
