variable "cidr_ip" {
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
        Name = "nsp"
        DontDelete = "true"
    }
}

variable "vpc_pub_subnet_tags" {
    type = map
    default = {
        Name = "nsp-pub-subnet"
        DontDelete = "true"
    }
}

variable "vpc_priv_subnet_tags" {
    type = map
    default = {
        Name = "nsp-priv-subnet"
        DontDelete = "true"
    }
}

variable "vpc_db_subnet_tags" {
    type = map
    default = {
        Name = "nsp-db-subnet"
        DontDelete = "true"
    }
}

variable "public-cidr-blocks" {
  type = list
  default = ["10.10.10.0/24","10.10.11.0/24"]
}

variable "private-cidr-blocks" {
  type = list
  default = ["10.10.20.0/24","10.10.21.0/24"]
}

variable "database-cidr-blocks" {
  type = list
  default = ["10.10.30.0/24","10.10.31.0/24"]
}

variable "dest-cidr" {
  default = "0.0.0.0/0"
}