output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.ajalah_prod.id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = [aws_subnet.public_a.id, aws_subnet.public_b.id, aws_subnet.public_c.id]
}



# output "vpc_id" {
#   description = "VPC ID"
#   value       = aws_vpc.main.id
# }

# output "public_subnet_ids" {
#   description = "List of public subnet IDs"
#   value       = aws_subnet.public[*].id
# }

# output "private_subnet_ids" {
#   description = "List of private subnet IDs"
#   value       = aws_subnet.private[*].id
# }
