<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 6 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_github"></a> [github](#provider\_github) | 6.13.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [github_team.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team) | resource |
| [github_team.subteams](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team) | resource |
| [github_team_members.main_members](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_members) | resource |
| [github_team_members.subteams](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_members) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_main_members"></a> [main\_members](#input\_main\_members) | Main team memebers | `map(string)` | n/a | yes |
| <a name="input_main_team_description"></a> [main\_team\_description](#input\_main\_team\_description) | Main team description | `string` | n/a | yes |
| <a name="input_main_team_name"></a> [main\_team\_name](#input\_main\_team\_name) | Main team name | `string` | n/a | yes |
| <a name="input_subteams"></a> [subteams](#input\_subteams) | Subteams configuration | <pre>map(object({<br/>    name        = string<br/>    description = string<br/>    members     = map(string)<br/>    }<br/>  ))</pre> | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_main_team_id"></a> [main\_team\_id](#output\_main\_team\_id) | Main team id |
| <a name="output_subteams_ids"></a> [subteams\_ids](#output\_subteams\_ids) | Subteams ids |
<!-- END_TF_DOCS -->
