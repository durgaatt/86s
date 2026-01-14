module "vpc" {
    source = "git::https://github.com/durgaatt/86s.git//terraform-vpc-module?ref=main"
    # VPC
    tenancy = var.tenancy
    cidr_ips = var.cidr_ips
    project = var.project
    environment = var.environment
    vpc_tags = var.vpc_tags

    # public subnets
    public-cidr-blocks = var.public-cidr-blocks
    vpc_pub_subnet_tags = var.vpc_pub_subnet_tags

    # private subnets
    private-cidr-blocks = var.private-cidr-blocks
    vpc_priv_subnet_tags = var.vpc_priv_subnet_tags

    # database subnets
    database-cidr-blocks = var.database-cidr-blocks
    vpc_db_subnet_tags = var.vpc_db_subnet_tags

    igw_tags = var.igw_tags
    public_rt_tags = var.public_rt_tags
    private_rt_tags = var.private_rt_tags
    database_rt_tags = var.database_rt_tags
    eip_tags = var.eip_tags
    nat_gateway_tags = var.nat_gateway_tags
    dest-cidr = var.dest-cidr
     
}