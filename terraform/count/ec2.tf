resource "aws_instance" "terraform" {
  count = length(var.instances)
  ami           = var.ami_id
  instance_type = var.ec2_tags.env == "TEST" ? "t2.large" : "t2.micro"
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.allow-all.id]
  tags = {
    Name = var.instances[count.index]
  }
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

   tags = {
    Name = var.sg_tags.name
  }
}