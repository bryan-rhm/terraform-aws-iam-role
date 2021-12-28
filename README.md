# Terraform AWS IAM Role module

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.43.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.43.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_policy_document.aws_trust_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_conditions"></a> [conditions](#input\_conditions) | Assume Role Conditions | <pre>list(object({<br>    condition = object({<br>      test     = string<br>      variable = string<br>      values   = list(string)<br>    })<br>  }))</pre> | `[]` | no |
| <a name="input_description"></a> [description](#input\_description) | Description for the IAM role | `string` | `"Created by terraform"` | no |
| <a name="input_managed_policy_arns"></a> [managed\_policy\_arns](#input\_managed\_policy\_arns) | List of ARNs of IAM policies to attach | `list(string)` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for the role | `string` | n/a | yes |
| <a name="input_statement_id"></a> [statement\_id](#input\_statement\_id) | Identifier for a policy statement (Statement ID). | `string` | `null` | no |
| <a name="input_trusted_identifier"></a> [trusted\_identifier](#input\_trusted\_identifier) | Entity allowed to assume the role | <pre>object({<br>    type        = string       # Ex: AWS<br>    identifiers = list(string) # Ex: Account id (1234424) | AWS service  ec2.amazonaws.com<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_output"></a> [output](#output\_output) | IAM role attributes |
