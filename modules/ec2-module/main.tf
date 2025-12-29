data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["099720109477"] # Canonical (Ubuntu)

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
resource "aws_instance" "myec2" {
    ami = data.aws_ami.app_ami.id
    instance_type = var.instance_type
    associate_public_ip_address = false
    tags = var.aws_common_tags
    vpc_security_group_ids = var.vpc_security_group_ids 
    subnet_id = var.subnet_id
    key_name = var.key_name

  provisioner "remote-exec" {
      inline = [
        "sudo apt update -y",
        "sudo apt install -y nginx",
        "sudo systemctl start nginx",
        "sudo systemctl enable nginx"
       ]

       connection {
         type = "ssh"
         user = "ubuntu"
         private_key = file("../.secrets/MyKey_GIT.pem")
         host = module.public_ip.ec2_public_ip         
       }     
    }

  depends_on = [aws_eip_association.eip_assoc]  
}
