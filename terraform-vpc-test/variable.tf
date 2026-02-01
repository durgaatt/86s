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
  default = "test"
}

variable "vpc_tags" {
    type = map
    default = {
        Name = "VPC"
        DontDelete = "true"
    }
}

variable "vpc_pub_subnet_tags" {
    type = map
    default = {
        Name = "vpc-pub-subnet"
        DontDelete = "true"
    }
}

variable "vpc_priv_subnet_tags" {
    type = map
    default = {
        Name = "vpc-priv-subnet"
        DontDelete = "true"
    }
}

variable "vpc_db_subnet_tags" {
    type = map
    default = {
        Name = "vpc-db-subnet"
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

variable "igw_tags" {
    type = map
    default = {
        Name = "VPC-IGW"
        DontDelete = "true"
    }
}

variable "public_rt_tags" {
    type = map
    default = {
        Name = "VPC-pub-rt"
        DontDelete = "true"
    }
}

variable "dest_cidr" {
  type = string
  default = "0.0.0.0/0"
}

variable "private_rt_tags" {
    type = map
    default = {
        Name = "VPC-priv-rt"
        DontDelete = "true"
    }
}

variable "database_rt_tags" {
    type = map
    default = {
        Name = "VPC-db-rt"
        DontDelete = "true"
    }
}

variable "eip_tags" {
    type = map
    default = {
        Name = "NSP-eip"
        DontDelete = "true"
    }
}

variable "nat_gateway_tags" {
    type = map
    default = {
        Name = "NSP-NATGW"
        DontDelete = "true"
    }
}

variable "is_peering_required" {
    type = bool
    default = false
}

variable "peering_tags" {
   type = map
   default = {
      Name = "VPC-2-Default-Peering"
    }
}