variable "cidr_ips" {
   default = "10.10.0.0/16"
}

variable "tenancy" {
  default = "default"
}

variable "project" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "vpc_tags" {
    type = map
    default = {
        Name = "NSP"
        DontDelete = "true"
    }
}

