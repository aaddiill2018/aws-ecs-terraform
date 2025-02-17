
# VPC Module
module "aws-vpc" {
  source          = "./modules/vpc"
  vpc_name        = var.vpc_name
  vpc_cidr_block  = var.vpc_cidr_block
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  availability_zones = var.availability_zones
  aws_region = var.aws_region
}


module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
}


module "elb" {
  source             = "./modules/elb"
  elb_name           = "my-application-load-balancer"
  security_groups    = [module.security.security_group_id]
  subnets            = module.vpc.public_subnets
  vpc_id             = module.vpc.vpc_id
  target_group_name  = "my-target-group"
  target_group_port  = 80
}


module "iam" {
  source = "./modules/iam"
}


module "ecs" {
  source             = "./modules/ecs"
  ecs_cluster_name   = "my-cluster"
  ecs_service_name   = "my-app-service"
  task_cpu           = 512
  task_memory        = 1024
  execution_role_arn = module.iam.execution_role_arn
  task_role_arn      = module.iam.task_role_arn
  container_image    = "nginx:latest"
  desired_count      = 2
  private_subnets    = module.vpc.private_subnets
  security_group_id  = module.security.security_group_id
  target_group_arn   = module.elb.target_group_arn
}

