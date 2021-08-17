variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
  default     = "10.0.0.0/16"
}

variable "public_cidrs" {
  type        = list(any)
  description = "CIDR for the Public Subnet"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_cidrs" {
  description = "CIDR for the Private Subnet"
  type        = list(any)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "region" {
  default     = "us-east-1"
  description = "Region to deploy infraestructure"
}
