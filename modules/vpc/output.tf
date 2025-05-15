output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
  
}
output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = aws_subnet.public_subnet[*].id
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = aws_subnet.private_subnet[*].id
}
output "nat_gateway_ids" {
  description = "The IDs of the NAT gateways"
  value       = aws_nat_gateway.main[*].id
}
output "internet_gateway_id" {
  description = "The ID of the internet gateway"
  value       = aws_internet_gateway.main.id
}
output "route_table_ids" {
  description = "The IDs of the route tables"
  value       = aws_route_table.public[*].id
}
output "route_table_association_ids" {
  description = "The IDs of the route table associations"
  value       = aws_route_table_association.public[*].id
}

output "vpc_cidr" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}
