output "eip_allocation_id" {
  description = "ID of Elastic IP"
  value = aws_eip.public_ip.id
}


output "ec2_public_ip" {
  description = "IP of Elastic IP"
  value = aws_eip.public_ip.public_ip
}