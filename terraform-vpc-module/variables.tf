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
