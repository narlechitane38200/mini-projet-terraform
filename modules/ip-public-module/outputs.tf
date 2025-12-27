output "eip_allocation_id" {
  description = "ID of Elastic IP"
  value = aws_eip.public_ip.id
}
