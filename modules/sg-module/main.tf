resource "aws_security_group" "allow_http_https_ssh" {
  name = "radouane-sg"
  description = "Allows http, https and ssh inbound trafic"
  vpc_id = var.vpc_id

  ingress {
    description = "TLS from VPC"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  
    ingress {
    description = "HTTPS from VPC"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

    ingress {
    description = "SSH from VPC"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    description = "allow all traffic from VPC"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}
