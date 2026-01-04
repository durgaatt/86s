resource "aws_instance" "test-insttf" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t2.micro"
  key_name = "devops"
  tags = {
    Name = "testvmtf"
  }
}
