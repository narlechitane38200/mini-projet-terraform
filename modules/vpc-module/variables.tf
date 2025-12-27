variable "vpc_cidr" {
  description = "CIDR du VPC"
  type        = string
}

variable "vpc_name" {
  description = "Nom du VPC"
  type        = string
}

variable "public_subnets" {
  description = "Liste des subnets publics"
  type = list(object({
    cidr = string
    az   = string
  }))
}

variable "private_subnets" {
  description = "Liste des subnets privés"
  type = list(object({
    cidr = string
    az   = string
  }))
}