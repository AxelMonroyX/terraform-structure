<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | 3.53.0 |
| http | 2.1.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| amis | ../../modules/amis | n/a |
| asg\_example\_elb | ../../modules/asg_elb | n/a |
| nat | ../../modules/nat | n/a |
| vpc | ../../modules/aws_vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_key_pair.develop](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [http_http.my_ip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Name of the environment | `string` | `"develop"` | no |

## Outputs

| Name | Description |
|------|-------------|
| dns\_name | Enter to this DNS to access the webpage |
<!-- END_TF_DOCS -->