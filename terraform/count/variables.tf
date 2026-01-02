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
    name = "mongodb"
    env = "PROD"
  } 
}

variable "sg_tags" {
  default = {
    name = "allow_all_sg"
  }
}

variable "zone_name" {
  default = "zaws.online"
}

variable "zone_id" {
  default = "Z097650110LRPT2ALGMEU"
}

variable "type" {
  default = "A"
}

variable "ttl" {
  default = "1"
}

variable "instances" {
    default = [ "mongodb", "catalogue", ]
}