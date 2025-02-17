# terraform.tfvars
aws_region = "me-south-1"
vpc_name = "my-vpc"
vpc_cidr_block = "10.3.0.0/16"
public_subnets = ["10.3.0.0/24", "10.3.1.0/24", "10.3.2.0/24"]
private_subnets = ["10.3.10.0/24", "10.3.11.0/24", "10.3.12.0/24"]
availability_zones = ["me-south-1a", "me-south-1b", "me-south-1c"]



elb_name           = "my-application-load-balancer"
target_group_name  = "my-target-group"
target_group_port  = 80
