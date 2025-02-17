variable "vpc_id" {
  description = "The VPC ID in which the ECS services will be deployed"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs for the load balancer"
  type        = list(string)
}

variable "app_subnets" {
  description = "List of private subnet IDs for ECS tasks"
  type        = list(string)
}

variable "container_image" {
  description = "Docker image URI for the ECS container"
  type        = string
}
