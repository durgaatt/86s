module "vpc" {
  source = "../terraform-vpc-module"
  cidr_ips = var.cidr_ips
  tenancy = var.tenancy
  project = var.project
  environment = var.environment
  vpc_tags = var.vpc_tags
}