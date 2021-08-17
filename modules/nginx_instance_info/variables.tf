variable "instance_type" {
  description = "Provide instance type for example t2.micro"
  default     = "t2.micro"
  type        = string
}

variable "key_name" {
  type        = string
  description = "Key name to access using ssh"
}

variable "ami" {
  type        = string
  description = "Provide the AMI to create autoscaling group"
}

variable "environment" {
  description = "For multiple environment"
  default     = "develop"
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID"
}

variable "vpc_elb_subnets" {
  type        = list(any)
  description = "A list of subnet IDs to attach to the ELB"
}

variable "size" {
  description = "Size of the autoscaling group"
  default     = "1"
}

variable "vpc_subnets" {
  type        = list(any)
  description = "A list of subnet IDs to launch resources in"
}

variable "allow_ssh_cidr_block" {
  type        = list(any)
  description = "CIDR to access through ssh, preferred your IP address/32 or use an internal CIDR for VPN"
}
