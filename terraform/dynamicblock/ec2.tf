resource "aws_instance" "test-insttf" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.roboshop_sg.id]
  tags = {
    Name = var.ec2_tags.name
    Env = var.ec2_tags.env
  }
}

resource "aws_security_group" "roboshop_sg" {
   name = var.sg_name

  dynamic "ingress" {
    for_each = toset(var.roboshop_ports)
    content{
    from_port        = ingress.value
    to_port          = ingress.value
    protocol         = var.protocol_tcp
    cidr_blocks      = var.cidr
  }
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