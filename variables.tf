
variable "region" {
  description = "AWS Region"
  type        = string
  default     = "me-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/20"
}



variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}
/////////////////////elb/////////////////
variable "elb_name" {
  description = "Name of the load balancer"
  type        = string
}

variable "security_groups" {
  description = "List of security groups for the ELB"
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



variable "lambda_name" {
  description = "Name of the Lambda resource"
  type        = list()
}


