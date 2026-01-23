resource "aws_instance" "test-insttf" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t2.micro"
  key_name = "devops"
  tags = {
    Name = "testvmtf"
  }
}
