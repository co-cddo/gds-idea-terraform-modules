<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.56.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_name"></a> [name](#input\_name) | Policy name | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | Tag 'Owner' added to resources | `string` | n/a | yes |
| <a name="input_statements"></a> [statements](#input\_statements) | Policy statements | <pre>list(object({<br/>    sid       = optional(string, null)<br/>    effect    = string<br/>    actions   = list(string)<br/>    resources = list(string)<br/>    condition = optional(object({<br/>      test     = string<br/>      variable = string<br/>      values   = list(string)<br/>    }), null)<br/>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_policy_arn"></a> [policy\_arn](#output\_policy\_arn) | Policy ARN |
<!-- END_TF_DOCS -->
