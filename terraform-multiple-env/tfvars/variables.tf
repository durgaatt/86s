variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}

variable "key_name" {
  default = "devops"
}

variable "instance_type" {
  default = ""
}

variable "environment" {
  
}

variable "project_name" {
  default = "roboshop"
}


variable "sg_name" {
  default = "allow-all"
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
    name = "allow_all_sg"
  }
}