<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6 |
| <a name="requirement_docker"></a> [docker](#requirement\_docker) | ~> 4 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.60.0 |
| <a name="provider_docker"></a> [docker](#provider\_docker) | 4.5.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [docker_registry_image.this](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/registry_image) | resource |
| [aws_ecr_authorization_token.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ecr_authorization_token) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_build_args"></a> [build\_args](#input\_build\_args) | Docker image build arguments | `map(string)` | n/a | yes |
| <a name="input_build_context"></a> [build\_context](#input\_build\_context) | Docker image build context path | `string` | n/a | yes |
| <a name="input_build_dockerfile"></a> [build\_dockerfile](#input\_build\_dockerfile) | Docker image build dockerfile path | `string` | n/a | yes |
| <a name="input_build_platform"></a> [build\_platform](#input\_build\_platform) | Docker image build platform | `string` | `"linux/amd64"` | no |
| <a name="input_repository_url"></a> [repository\_url](#input\_repository\_url) | ECR repository url | `string` | n/a | yes |
| <a name="input_tag_name"></a> [tag\_name](#input\_tag\_name) | Docker image tag name | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_name"></a> [name](#output\_name) | The name of the Docker image. |
| <a name="output_sha256_digest"></a> [sha256\_digest](#output\_sha256\_digest) | The sha256 digest of the image. |
<!-- END_TF_DOCS -->
