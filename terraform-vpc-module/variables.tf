variable "cidr_ips" {
   type        = string
   description = "Please provide VPC CIDR"
}

variable "tenancy" {
  type = string
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
    
}

variable "vpc_priv_subnet_tags" {
    type = map
    
}

variable "vpc_db_subnet_tags" {
    type = map
    
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
}
