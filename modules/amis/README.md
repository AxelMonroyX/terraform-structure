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
| [aws_ami.latest_nat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_ami.latest_ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| ami\_latest\_nat | Will output the latest AMI for latest nat hvm ebs |
| ami\_ubuntu\_18\_04 | Will output the latest AMI for latest ubuntu 18.04 hvm ebs |
<!-- END_TF_DOCS -->