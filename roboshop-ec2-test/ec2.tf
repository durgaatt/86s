module "test-vm" {

  source = "../terraform-aws-instance-module"
  ami_id = var.ami_id
  instance_type = var.instance_type
  sg_ids = var.sg_ids
  tags = var.tags

}

output "publicip" {
  value = module.test-vm.public_ip
}

output "privateip" {
  value = module.test-vm.private_ip
}

output "instid" {
  value = module.test-vm.instance_id
}