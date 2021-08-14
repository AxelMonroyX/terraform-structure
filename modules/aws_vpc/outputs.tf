output "vpc_default_cidr" {
  value       = var.vpc_cidr
  description = "Returns cidr from default vpc"
}

output "aws_vpc_main_id" {
  value       = aws_vpc.main.id
  description = "Returns id of the new VPN"
}

output "public_subnets" {
  value       = aws_subnet.public_subnets.*.id
  description = "List of ids of public subnets"
}

output "public_subnet_cidrs" {
  value       = var.public_cidrs
  description = "List of cidrs of public subnets "
}

output "private_subnets" {
  value       = aws_subnet.private_subnets.*.id
  description = "List of ids of private subnets"
}

output "private_subnet_cidrs" {
  value       = var.private_cidrs
  description = "List of cidrs of private subnets "
}
