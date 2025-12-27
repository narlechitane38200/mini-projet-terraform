variable "type" {
    type = string
    description = "set aws volume type"
    default = "gp3"
}

variable "aws_common_tags" {
    type = map(any)
    description = "Set aws tag"
    default = {
      Name = "radouane-ebs"
    }
}

variable "size" {
  description = "Size of the EBS volume in GiB"
  type        = number
  default     = 8
}

variable "availability_zone" {
  description = "Availability Zone for the EBS volume"
  type        = string
}
