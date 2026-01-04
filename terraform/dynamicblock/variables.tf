variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}

variable "key_name" {
  default = "devops"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "sg_name" {
  default = "roboshop_sg"
}

variable "ingress_from_port" {
  default = "0"
}

variable "egress_to_port" {
  default = "0"
}

variable "egress_from_port" {
  default = "0"
}

variable "ingress_to_port" {
  default = "0"
}

variable "protocol" {
  default = "-1"
}

variable "protocol_tcp" {
  default = "tcp"
}

variable "cidr" {
  default = ["0.0.0.0/0"]
}

variable "ec2_tags" {
  default = {
    name = "test-insttf"
    env = "PROD"
  }
}

variable "sg_tags" {
  default = {
    name = "roboshop_sg"
  }
}

variable "roboshop_ports" {
  default = [80,22,8080,22017,6379]
}