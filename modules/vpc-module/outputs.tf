output "vpc_id" {
  description = "VPC id"
  value       = aws_vpc.myvpc.vpc.id
}


output "public_subnet_ids" {
  description = "IDs des subnets publics"
  value       = [for s in aws_subnet.public : s.id]
}

output "igw_id" {
  description = "ID de l'Internet Gateway"
  value       = aws_internet_gateway.this.id
}