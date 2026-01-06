variable "ami_id" {
  default = ""
}

variable "instance_type" {
    default = "t3.micro"
}

variable "sg_ids" {
  default = ["sg-0c583752c872b814e"]
}

variable "tags" {
    default = {
        Name = "test-vm"
    }
}