variable "elb_name" {
  description = "Name of the load balancer"
  type        = string
}

variable "security_groups" {
  description = "List of security groups for the ELB"
  type        = list(string)
}

variable "subnets" {
  description = "List of subnets for the ELB"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "target_group_name" {
  description = "Name of the target group"
  type        = string
}

variable "target_group_port" {
  description = "Port for the target group"
  type        = number
}
