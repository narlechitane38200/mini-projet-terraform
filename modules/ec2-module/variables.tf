variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.nano"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "Liste des Security Group IDs pour l'instance EC2"
  default     = []
}

variable "aws_common_tags" {
  description = "Common AWS tags applied to resources"
  type        = map(string)
  default     = {}
}

variable "key_name" {
  type        = string
  description = "Nom de la key pair AWS"
}

variable "subnet_id" {
  description = "Subnet où placer l'EC2"
  type        = string
}