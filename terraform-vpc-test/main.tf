module "vpc" {
  source = "../terraform-vpc-module"
  cidr_ips = var.cidr_ips
  tenancy = var.tenancy
  project = var.project
  environment = var.environment
  vpc_tags = var.vpc_tags
  public-cidr-blocks = var.public-cidr-blocks
  private-cidr-blocks = var.private-cidr-blocks
  database-cidr-blocks = var.database-cidr-blocks
  vpc_pub_subnet_tags = var.vpc_pub_subnet_tags
  vpc_priv_subnet_tags = var.vpc_priv_subnet_tags
  vpc_db_subnet_tags = var.vpc_db_subnet_tags
  igw_tags = var.igw_tags
}
