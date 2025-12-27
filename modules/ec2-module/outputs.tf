output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.myec2.id
}

output "availability_zone" {
  description = "EC2 availability zone"
  value       = aws_instance.myec2.availability_zone
}
