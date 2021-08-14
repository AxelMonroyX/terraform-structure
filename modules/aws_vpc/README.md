<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_subnet.private_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| private\_cidrs | CIDR for the Private Subnet | `list(any)` | ```[ "10.0.3.0/24", "10.0.4.0/24" ]``` | no |
| public\_cidrs | CIDR for the Public Subnet | `list(any)` | ```[ "10.0.1.0/24", "10.0.2.0/24" ]``` | no |
| region | n/a | `string` | `"us-east-1"` | no |
| vpc\_cidr | CIDR for the whole VPC | `string` | `"10.0.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| aws\_vpc\_main\_id | Returns id of the new VPN |
| private\_subnet\_cidrs | List of cidrs of private subnets |
| private\_subnets | List of ids of private subnets |
| public\_subnet\_cidrs | List of cidrs of public subnets |
| public\_subnets | List of ids of public subnets |
| vpc\_default\_cidr | Returns cidr from default vpc |
<!-- END_TF_DOCS -->