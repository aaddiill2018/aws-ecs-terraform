output "ecs_cluster_id" {
  description = "The ECS cluster ID"
  value       = aws_ecs_cluster.ajalah_prod_cluster.id
}

output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = aws_lb.ajalah_prod_alb.dns_name
}

output "ecs_service_name" {
  description = "The ECS service name"
  value       = aws_ecs_service.ajalah_prod_service.name
}
