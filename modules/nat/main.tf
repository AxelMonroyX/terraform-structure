resource "aws_internet_gateway" "main" {
  vpc_id = var.aws_vpc_id
}

resource "aws_route_table" "route_table_public" {
  vpc_id = var.aws_vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_route_table_association" "route_table_public" {
  # count          = "${length(var.public_subnets)}"
  count          = 2
  subnet_id      = element(var.public_subnets, count.index)
  route_table_id = aws_route_table.route_table_public.id
  depends_on     = [aws_route_table.route_table_public]
}

resource "aws_security_group" "nat" {
  name        = "vpc_nat"
  description = "Allow traffic to pass from the private subnet to the internet"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.private_subnet_cidrs
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc_cidr}"]
  }

  egress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = var.aws_vpc_id

  tags = {
    Name = "NATSG"
  }
}

resource "aws_instance" "nat" {
  ami                         = var.ami_nat
  availability_zone           = "${var.region}a"
  instance_type               = var.nat_instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = ["${aws_security_group.nat.id}"]
  subnet_id                   = var.public_subnets[0]
  associate_public_ip_address = true
  source_dest_check           = false

  tags = {
    Name = "VPC NAT"
  }
}

resource "aws_eip" "nat" {
  instance = aws_instance.nat.id
  vpc      = true
}
