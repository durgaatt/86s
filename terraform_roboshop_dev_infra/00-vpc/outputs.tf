output "vpcid" {
  value = module.vpc.vpc_id
}

output "pub_subnet_id" {
  value = module.vpc.public_subnet_ids
}

output "priv_subnet_id" {
  value = module.vpc.private_subnet_ids
}

output "db_subnet_id" {
  value = module.vpc.database_subnet_ids
}

output "aws_vpc_peering_id" {
  value = module.aws_vpc_peering_connection
}