provider "aws" {
  region = var.region
}

resource "aws_instance" "my_instance" {
  ami           = var.ec2_ami # Replace your selected ami in variable.tf
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name = "jenkins1" #Replace your key
  tags = {
    "Name" = "Web Server"
  }
}

resource "aws_security_group" "sg" {
  name = "webserve-sg"
  description = "Security group for the webser instance"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}