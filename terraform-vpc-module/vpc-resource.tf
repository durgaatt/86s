resource "aws_vpc" "this" {
  cidr_block       = var.cidr_ips
  instance_tenancy = var.tenancy
  enable_dns_hostnames = true

  tags = merge(var.vpc_tags,local.common_tags,
  {
    Name = "${local.common_name_suffix}-${var.vpc_tags.Name}"
  }
  )
}