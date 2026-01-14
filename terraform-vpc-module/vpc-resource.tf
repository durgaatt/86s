resource "aws_vpc" "this" {
  cidr_block       = var.cidr_ips
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

tags = merge(var.igw_tags,local.common_tags,
  {
    Name = "${local.common_name_suffix}-${var.igw_tags.Name}"
  }
  )

}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  tags = merge(var.public_rt_tags,local.common_tags,
  {
    Name = "${local.common_name_suffix}-${var.public_rt_tags.Name}"
  }
  )
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

 tags = merge(var.private_rt_tags,local.common_tags,
  {
    Name = "${local.common_name_suffix}-${var.private_rt_tags.Name}"
  }
  )
}

resource "aws_route_table" "database" {
  vpc_id = aws_vpc.this.id

  tags = merge(var.database_rt_tags,local.common_tags,
  {
    Name = "${local.common_name_suffix}-${var.database_rt_tags.Name}"
  }
  )
}

resource "aws_route" "public" {
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = var.dest-cidr
  gateway_id = aws_internet_gateway.gw.id
}

resource "aws_eip" "nat" {
  domain   = "vpc"

  tags = merge(
    var.eip_tags,
    local.common_tags,
    {
        Name = "${local.common_name_suffix}-${var.eip_tags.Name}"
    }
  )
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = "${aws_subnet.public[0].id}"

  tags = merge(
    var.nat_gateway_tags,
    local.common_tags,
    {
        Name = "${local.common_name_suffix}-${var.nat_gateway_tags.Name}"
    }
  )
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_route" "private" {
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = var.dest-cidr
  gateway_id = aws_nat_gateway.nat.id
}

resource "aws_route" "database" {
  route_table_id            = aws_route_table.database.id
  destination_cidr_block    = var.dest-cidr
  gateway_id = aws_nat_gateway.nat.id
}

resource "aws_route_table_association" "public" {
  count = length(var.public-cidr-blocks)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
   count = length(var.private-cidr-blocks)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "database" {
   count = length(var.database-cidr-blocks)
  subnet_id      = aws_subnet.database[count.index].id
  route_table_id = aws_route_table.database.id
}