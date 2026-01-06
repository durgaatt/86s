locals {
  common_name = "${var.project_name}-${terraform.workspace}"
  common_tags = {
    Project = var.project_name
    Terraform = "true"
  }
}