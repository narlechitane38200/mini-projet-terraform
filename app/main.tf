#Terraform v1.14.2 
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 6.26.0"
    }
  }
  required_version = "1.14.2"
}


provider "aws" {
  region = "us-east-1"
  shared_credentials_files = [ "../.secrets/credentials" ]
  profile = "radouane-mini-projet"
}


module "myec2" {
  source        = "../modules/ec2-module"
  instance_type = var.instance_type
  aws_common_tags = var.aws_common_tags 
  vpc_security_group_ids = [module.allow_http_https_ssh.security_group_id]
  key_name = "MyKey_GIT"
}

module "myvpc" {
  source = "../modules/vpc-module"

  vpc_name = "radouane-vpc"
  vpc_cidr = "172.31.0.0/16"

  public_subnets = [
    { cidr = "172.31.1.0/24", az = "us-east-1a" },
  ]
   private_subnets = [
    { cidr = "172.31.101.0/24", az = "us-west-1a" },
  ]
}

module "allow_http_https_ssh" {
  source        = "../modules/sg-module"
}

module "public_ip" {
  source        = "../modules/ip-public-module"
}

module "myebs" {
  source        = "../modules/ebs-module"
  availability_zone = module.myec2.availability_zone
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = module.myec2.instance_id
  allocation_id = module.public_ip.eip_allocation_id
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdf"
  volume_id   = module.myebs.ebs_volume_id
  instance_id = module.myec2.instance_id
}

resource "null_resource" "write_ec2_ip" {
  provisioner "local-exec" {
    command = "echo ${module.public_ip.eip_allocation_id} >> ip_ec2.txt"
  }
}