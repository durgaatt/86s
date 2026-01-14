output "vpc_id" {
    value = aws_vpc.this.id
}


output "public_subnet_ids" {
    value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
    value = aws_subnet.private[*].id
}

output "database_subnet_ids" {
    value = aws_subnet.database[*].id
}

output "aws_vpc_peering_id" {
  value = aws_vpc_peering_connection.default[*].id
}

