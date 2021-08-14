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
| [aws_eip.nat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_instance.nat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_internet_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route_table.route_table_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.route_table_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.nat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ami\_nat | Nat instance provide by AWS depends on the region | `any` | n/a | yes |
| aws\_vpc\_id | n/a | `any` | n/a | yes |
| key\_name | Key to access using SSH | `any` | n/a | yes |
| nat\_instance\_type | Instance type for the Nat instance | `string` | `"m1.small"` | no |
| private\_subnet\_cidrs | List of cidrs for private subnets | `list(any)` | n/a | yes |
| private\_subnets | List of private subnets | `list(any)` | n/a | yes |
| public\_subnets | List of public subnets | `list(any)` | n/a | yes |
| region | Region to deploy nat instance | `string` | `"us-east-1"` | no |
| vpc\_cidr | Cidr of the VPC | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->