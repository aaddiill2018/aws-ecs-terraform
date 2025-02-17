resource "aws_security_group" "ecs_sg" {
  name        = "ecs-security-group"
  description = "Allow inbound traffic for ECS services"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ecs-security-group"
  }
}

resource "aws_lb" "ajalah_prod_alb" {
  name               = "ajalah-prod-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups   = [aws_security_group.ecs_sg.id]
  subnets            = var.public_subnets
  enable_deletion_protection = false

  enable_cross_zone_load_balancing = true

  tags = {
    Name = "ajalah-prod-alb"
  }
}

resource "aws_lb_target_group" "ajalah_prod_target_group" {
  name     = "ajalah-prod-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    interval            = 30
    path                = "/health"
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

  tags = {
    Name = "ajalah-prod-target-group"
  }
}

resource "aws_lb_listener" "ajalah_prod_listener" {
  load_balancer_arn = aws_lb.ajalah_prod_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "fixed-response"
    fixed_response {
      status_code = 200
      content_type = "text/plain"
      message_body = "OK"
    }
  }
}

resource "aws_ecs_cluster" "ajalah_prod_cluster" {
  name = "ajalah-prod-cluster"
}

resource "aws_ecs_task_definition" "ajalah_prod_task" {
  family                   = "ajalah-prod-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([{
    name      = "ajalah-prod-container"
    image     = var.container_image
    essential = true
    portMappings = [
      {
        containerPort = 80
        hostPort      = 80
      }
    ]
  }])

  tags = {
    Name = "ajalah-prod-task"
  }
}

resource "aws_ecs_service" "ajalah_prod_service" {
  name            = "ajalah-prod-service"
  cluster         = aws_ecs_cluster.ajalah_prod_cluster.id
  task_definition = aws_ecs_task_definition.ajalah_prod_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"
  network_configuration {
    subnets          = var.app_subnets
    assign_public_ip = true
    security_groups = [aws_security_group.ecs_sg.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.ajalah_prod_target_group.arn
    container_name   = "ajalah-prod-container"
    container_port   = 80
  }

  tags = {
    Name = "ajalah-prod-service"
  }
}
