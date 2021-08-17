data "http" "my_ip" {
  url = "http://ipv4.icanhazip.com"
}

data "aws_availability_zones" "available" {
  state = "available"
}

module "amis" {
  source = "../../modules/amis"
}

module "vpc" {
  source = "../../modules/aws_vpc"
}

module "nat" {
  source               = "../../modules/nat"
  vpc_cidr             = module.vpc.vpc_default_cidr
  ami_nat              = module.amis.ami_latest_nat
  aws_vpc_id           = module.vpc.aws_vpc_main_id
  public_subnets       = module.vpc.public_subnets
  private_subnets      = module.vpc.private_subnets
  private_subnet_cidrs = module.vpc.private_subnet_cidrs
  key_name             = aws_key_pair.develop.key_name
}

resource "aws_key_pair" "develop" {
  key_name   = "develop"
  public_key = file("./files/ssh_keys/develop.pub")
}

module "nginx_instance_info" {
  source               = "../../modules/nginx_instance_info"
  environment          = var.environment
  instance_type        = "t2.micro"
  size                 = 1
  allow_ssh_cidr_block = [module.vpc.vpc_default_cidr]
  ami                  = module.amis.ami_ubuntu_18_04
  vpc_id               = module.vpc.aws_vpc_main_id
  vpc_subnets          = module.vpc.public_subnets
  vpc_elb_subnets      = module.vpc.public_subnets
  key_name             = aws_key_pair.develop.key_name
}
