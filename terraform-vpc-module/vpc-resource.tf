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

resource "aws_subnet" "public" {
  count = length(var.public-cidr-blocks)
  vpc_id     = aws_vpc.this.id
  cidr_block = var.public-cidr-blocks[count.index]
  map_public_ip_on_launch = true
  availability_zone = local.az_names[count.index]
  tags = merge(var.vpc_tags,local.common_tags,
  {
    Name = "${local.common_name_suffix}-${var.vpc_pub_subnet_tags.Name}-${count.index}"
  }
  )
}

resource "aws_subnet" "private" {
  count = length(var.private-cidr-blocks)
  vpc_id     = aws_vpc.this.id
  cidr_block = var.private-cidr-blocks[count.index]
  availability_zone = local.az_names[count.index]
  tags = merge(var.vpc_tags,local.common_tags,
  {
    Name = "${local.common_name_suffix}-${var.vpc_priv_subnet_tags.Name}-${count.index}"
  }
  )
}

resource "aws_subnet" "database" {
  count = length(var.database-cidr-blocks)
  vpc_id     = aws_vpc.this.id
  cidr_block = var.database-cidr-blocks[count.index]
  availability_zone = local.az_names[count.index]
  tags = merge(var.vpc_tags,local.common_tags,
  {
    Name = "${local.common_name_suffix}-${var.vpc_db_subnet_tags.Name}-${count.index}"
  }
  )
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.this.id

tags = merge(var.vpc_tags,local.common_tags,
  {
    Name = "${local.common_name_suffix}-${var.igw_tags.Name}"
  }
  )

}