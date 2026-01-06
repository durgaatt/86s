resource "aws_instance" "test-insttf" {
  ami           = var.ami_id
  instance_type = lookup(var.instance_type,terraform.workspace)
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.allow-all.id]
  tags = merge(local.common_tags,
  {
    Name = "${local.common_name}.wrkspac-env"
  }
  )
}

resource "aws_security_group" "allow-all" {
   name = var.sg_name
  ingress {
    from_port        = var.ingress_from_port
    to_port          = var.ingress_to_port
    protocol         = var.protocol
    cidr_blocks      = var.cidr
  }

  egress {
    from_port        = var.egress_from_port
    to_port          = var.egress_to_port
    protocol         = var.protocol
    cidr_blocks      = var.cidr
  }

   tags = merge(local.common_tags,
  {
    Name = "${local.common_name}.wrkspac-env"
  }
  )
}