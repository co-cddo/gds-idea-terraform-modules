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
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_kms_key_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key_policy) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_lifecycle_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_logging.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_logging) | resource |
| [aws_s3_bucket_notification.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_notification) | resource |
| [aws_s3_bucket_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_eventbridge_notifications"></a> [eventbridge\_notifications](#input\_eventbridge\_notifications) | Enable eventbridge notifications | `bool` | `false` | no |
| <a name="input_lambda_functions_notifications"></a> [lambda\_functions\_notifications](#input\_lambda\_functions\_notifications) | Lambda functions notifications | <pre>map(object({<br/>    lambda_function_arn = string,<br/>    events              = optional(list(string), ["s3:ObjectCreated:*"]),<br/>    filter_prefix       = optional(string, null),<br/>    filter_suffix       = optional(string, null),<br/>  }))</pre> | `{}` | no |
| <a name="input_lifecycle_delete_days"></a> [lifecycle\_delete\_days](#input\_lifecycle\_delete\_days) | Number of days after which to delete old files. If set to '0' files won't be removed | `number` | `0` | no |
| <a name="input_name"></a> [name](#input\_name) | S3 bucket name | `string` | n/a | yes |
| <a name="input_newer_noncurrent_versions"></a> [newer\_noncurrent\_versions](#input\_newer\_noncurrent\_versions) | Number of noncurrent versions Amazon S3 will retain. Must be a non-zero positive integer | `number` | `10` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | Tag 'Owner' added to resources | `string` | n/a | yes |
| <a name="input_policy"></a> [policy](#input\_policy) | Bucket policy in json format | `string` | `""` | no |
| <a name="input_s3_bucket_logging"></a> [s3\_bucket\_logging](#input\_s3\_bucket\_logging) | S3 bucket logging name | `string` | `""` | no |
| <a name="input_server_side_encryption"></a> [server\_side\_encryption](#input\_server\_side\_encryption) | Enable KMS server side encryption for bucket | `bool` | `false` | no |
| <a name="input_versioning"></a> [versioning](#input\_versioning) | Enable bucket versioning | `bool` | `false` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_arn"></a> [arn](#output\_arn) | S3 bucket arn |
| <a name="output_kms_arn"></a> [kms\_arn](#output\_kms\_arn) | Bucket encryption KMS key |
| <a name="output_name"></a> [name](#output\_name) | S3 bucket name |
<!-- END_TF_DOCS -->
