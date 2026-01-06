resource "aws_instance" "test-insttf" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.allow-all.id]
  tags = {
    Name = var.ec2_tags.name
    Env = var.ec2_tags.env
  }

  provisioner "local-exec" {
    command = "echo Instance: ${self.tags.Name} launched successfully"
    when = create
  }

  provisioner "local-exec" {
    command = "echo The server's public IP address is ${self.public_ip}"
    when = create
  }

  provisioner "local-exec" {
    command = "echo Instance: ${self.tags.Name} with ip: ${self.private_ip} Terminated successfully"
    when = destroy
  }

  provisioner "remote-exec" {
    connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     =  self.public_ip
  }
    inline = [
      "sudo dnf install httpd -y",
      "sudo  echo '<h1> Welcome to DevOps </h1>' > /var/www/html/index.html",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd"
    ]
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