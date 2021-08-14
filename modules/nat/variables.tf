variable "aws_vpc_id" {}

variable "public_subnets" {
  type        = list(any)
  description = "List of public subnets"
}

variable "private_subnets" {
  type        = list(any)
  description = "List of private subnets"
}

variable "private_subnet_cidrs" {
  type        = list(any)
  description = "List of cidrs for private subnets"
}

variable "vpc_cidr" {
  description = "Cidr of the VPC"
}

variable "key_name" {
  description = "Key to access using SSH"
}

variable "ami_nat" {
  description = "Nat instance provide by AWS depends on the region"
}

variable "region" {
  default     = "us-east-1"
  description = "Region to deploy nat instance"
}

variable "nat_instance_type" {
  default     = "m1.small"
  description = "Instance type for the Nat instance"
}
