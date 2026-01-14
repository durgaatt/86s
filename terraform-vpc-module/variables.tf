variable "cidr_ips" {
   type        = string
   description = "Please provide VPC CIDR"
}

variable "tenancy" {
  type = string
  default = "default"
}

variable "project" {
  type = string
  
}

variable "environment" {
  type = string
}

variable "vpc_tags" {
    type = map
    
}

variable "vpc_pub_subnet_tags" {
    type = map
    default = {

    }
    
}

variable "vpc_priv_subnet_tags" {
    type = map
    default = {
      
    }
}

variable "vpc_db_subnet_tags" {
    type = map
    default = {
      
    }
}

variable "public-cidr-blocks" {
  type = list
}

variable "private-cidr-blocks" {
  type = list
}

variable "database-cidr-blocks" {
  type = list
}

variable "igw_tags" {
    type = map
    default = {
      
    }
}

variable "public_rt_tags" {
  type = map
  default = {
      
    }
}

variable "private_rt_tags" {
  type = map
  default = {
      
    }
}

variable "database_rt_tags" {
  type = map
  default = {
      
    }
}

variable "dest-cidr" {
  type = string
  default = ""
}

variable "eip_tags" {
  type = map
  default = {
      
    }
}

variable "nat_gateway_tags" {
   type = map
   default = {
      
    }
}