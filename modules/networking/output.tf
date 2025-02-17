# Outputs to show IDs of the key resources created

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.ajalah_prod_igw.id
}

output "nat_gateway_ids" {
  description = "The IDs of the NAT Gateways"
  value       = [
    aws_nat_gateway.ajalah_prod_nat_a.id,
    aws_nat_gateway.ajalah_prod_nat_b.id,
    aws_nat_gateway.ajalah_prod_nat_c.id
  ]
}

output "route_table_ids" {
  description = "The IDs of the Route Tables"
  value       = [
    aws_route_table.ajalah_prod_public_rt.id,
    aws_route_table.ajalah_prod_private_rt_a.id,
    aws_route_table.ajalah_prod_private_rt_b.id,
    aws_route_table.ajalah_prod_private_rt_c.id
  ]
}
