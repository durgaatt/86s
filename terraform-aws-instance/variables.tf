variable "ami_id" {
  type = string
  description = "we are using rhel9 ami_id"
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  type = string
  description = "Instance type used for creating EC2 instance"
  validation {
    condition     = contains(["t3.micro", "t3.small", "t3.medium"], var.instance_type)
    error_message = "Please select either t3 micro or t3 small or t3 medium"
  }
}

variable "sg_ids" {
  type = list
}

variable "tags" {
  type = map
  default = {}
}