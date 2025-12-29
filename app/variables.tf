variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "aws_common_tags" {
  type    = map(string)
  default = {
    Name = "Radouane-ec2-mini-projet"
  }
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "Liste des Security Group IDs pour l'instance EC2"
  default     = []
}

variable "vpc_name" {
  description = "Nom du VPC"
  type        = string
  default = "radouane-myvpc"
}
