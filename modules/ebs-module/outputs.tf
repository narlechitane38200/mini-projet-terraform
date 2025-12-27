output "ebs_volume_id" {
  description = "ID of EBS volume"
  value = aws_ebs_volume.myebs.id
}

output "ebs_volume_az" {
  description = "Availability Zone of the EBS volume"
  value       = aws_ebs_volume.myebs.availability_zone
}
