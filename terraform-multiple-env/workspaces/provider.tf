terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.27.0"
    }
  }

  backend "s3" {
    bucket = "s3bukt-remote-state-file"
    key    = "remote-state-demo"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
  }
}


provider "aws" {
  # Configuration options
}

  #  terraform.exe workspace list
  #  terraform.exe workspace new dev
  #  terraform.exe workspace list
  #  terraform.exe workspace select default
  #  terraform.exe workspace list
  #  terraform.exe workspace select dev
  #  terraform.exe workspace list
  #  terraform.exe plan init

