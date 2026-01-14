module "vpc" {
    source = "git::https://github.com/durgaatt/86s.git//terraform-vpc-module?ref=main"
    # VPC
    cidr_ips = var.cidr_ips
    tenancy = var.tenancy
    vpc_cidr = var.cidr_ips
    project = var.project
    environment = var.environment
    vpc_tags = var.vpc_tags

    # public subnets
    public-cidr-blocks = var.public-cidr-blocks
    # vpc_pub_subnet_tags = var.vpc_pub_subnet_tags

    # private subnets
    private-cidr-blocks = var.private-cidr-blocks

    # database subnets
    database-cidr-blocks = var.database-cidr-blocks

    dest-cidr = var.dest-cidr
}