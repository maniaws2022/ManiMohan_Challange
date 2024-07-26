variable "region" {
  type = string
  default = "us-east-1"
}

variable "ec2_ami" {
  type = string
  default = "ami-04a81a99f5ec58529"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}