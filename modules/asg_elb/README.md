<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| template | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.nginx_example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_elb.nginx_example_elb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elb) | resource |
| [aws_launch_configuration.nginx_example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_configuration) | resource |
| [aws_security_group.nginx_example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.nginx_example_allow_elb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [template_cloudinit_config.user_data](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/cloudinit_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allow\_ssh\_cidr\_block | CIDR to access through ssh, preferred your IP address/32 or use an internal CIDR for VPN | `list(any)` | n/a | yes |
| ami | Provide the AMI to create autoscaling group | `string` | n/a | yes |
| environment | For multiple environment | `string` | `"develop"` | no |
| instance\_type | Provide instance type for example t2.micro | `string` | `"t2.micro"` | no |
| key\_name | Key name to access using ssh | `string` | n/a | yes |
| size | Size of the autoscaling group | `string` | `"1"` | no |
| vpc\_elb\_subnets | A list of subnet IDs to attach to the ELB | `list(any)` | n/a | yes |
| vpc\_id | The VPC ID | `string` | n/a | yes |
| vpc\_subnets | A list of subnet IDs to launch resources in | `list(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| aws\_security\_group\_web | This will be used to give access to the NAT |
| dns\_name | DNS name for access to the webpage |
<!-- END_TF_DOCS -->