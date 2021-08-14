data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "terraform-aws-vpc"
  }
}

resource "aws_subnet" "public_subnets" {
  count  = 2
  vpc_id = aws_vpc.main.id

  cidr_block        = var.public_cidrs[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnets" {
  count  = 2
  vpc_id = aws_vpc.main.id

  cidr_block = var.private_cidrs[count.index]

  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}
