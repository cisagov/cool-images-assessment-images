# cool-images-assessment-images #

[![GitHub Build Status](https://github.com/cisagov/cool-images-assessment-images/workflows/build/badge.svg)](https://github.com/cisagov/cool-images-assessment-images/actions)

Terraform code to create roles related to the creation of and access to buckets
to house assessment images in the Images (Production) and Images (Staging)
accounts in the COOL.

## Pre-requisites ##

- [Terraform](https://www.terraform.io/) installed on your system.
- An accessible AWS S3 bucket to store Terraform state
  (specified in [backend.tf](backend.tf)).
- An accessible AWS DynamoDB database to store the Terraform state lock
  (specified in [backend.tf](backend.tf)).
- Access to all of the Terraform remote states specified in
  [remote_states.tf](remote_states.tf).
- The following COOL accounts and roles must have been created:
  - Images (Production and Staging):
    [`cisagov/cool-accounts/images`](https://github.com/cisagov/cool-accounts/tree/develop/images)
  - Terraform:
    [`cisagov/cool-accounts/terraform`](https://github.com/cisagov/cool-accounts/tree/develop/terraform)
  - Users:
    [`cisagov/cool-accounts/users`](https://github.com/cisagov/cool-accounts/tree/develop/users)

<!-- BEGIN_TF_DOCS -->
## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 1.0 |
| aws | ~> 4.9 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 4.9 |
| aws.images\_production | ~> 4.9 |
| aws.images\_staging | ~> 4.9 |
| aws.users | ~> 4.9 |
| terraform | n/a |

## Modules ##

| Name | Source | Version |
|------|--------|---------|
| read\_terraform\_state | github.com/cisagov/terraform-state-read-role-tf-module | n/a |

## Resources ##

| Name | Type |
|------|------|
| [aws_iam_policy.fullaccess_policy_production](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.fullaccess_policy_staging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.provision_bucket_production](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.provision_bucket_staging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.fullaccess_role_production](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.fullaccess_role_staging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.fullaccess_role_production](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.fullaccess_role_staging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.provision_bucket_production](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.provision_bucket_staging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_s3_bucket.production](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.staging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_ownership_controls.production](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_ownership_controls.staging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_policy.vpcreadaccess_policy_production](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_policy.vpcreadaccess_policy_staging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.production](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_public_access_block.staging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_caller_identity.users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.fullaccess_policy_production](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.fullaccess_policy_staging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.provision_bucket_production](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.provision_bucket_staging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.vpcreadaccess_policy_production](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.vpcreadaccess_policy_staging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [terraform_remote_state.images_production](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.images_staging](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.sharedservices_networking_production](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.sharedservices_networking_staging](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.terraform](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.users](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| assessment\_images\_bucket\_base\_name | The base name to use for the assessment images S3 buckets. This value will be appended with "-production" or "-staging" to create the appropriate full bucket name (e.g. With the default value "cisa-cool-assessment-images-production" will be used for the bucket in the Images (Production) account). | `string` | `"cisa-cool-assessment-images"` | no |
| assessmentimagesbucketfullaccess\_role\_description | The description to associate with the IAM role and attached policy that allows full access to the assessment images S3 bucket. | `string` | `"Allows full access to the S3 bucket where assessment images are stored."` | no |
| assessmentimagesbucketfullaccess\_role\_name | The name to associate with the IAM role and attached policy that allows full access to the assessment images S3 bucket. | `string` | `"AssessmentImagesBucketFullAccess"` | no |
| assessmentimagesbucketfullaccess\_role\_session\_max\_duration | The maximum duration in seconds to allow a session that assumes the IAM role that allows full access to the assessment images S3 bucket. The default is the maximum of 12 hours due to using the AWS console to upload objects to the bucket. | `number` | `43200` | no |
| aws\_region | The AWS region to use for the account provisioners (e.g. "us-east-1"). | `string` | `"us-east-1"` | no |
| provisionassessmentimagesbucket\_policy\_description | The description to associate with the IAM policy that allows provisioning of the assessment images S3 bucket in the Images account. | `string` | `"Allows provisioning of assessment images S3 resources in the Images account."` | no |
| provisionassessmentimagesbucket\_policy\_name | The name to associate with the IAM policy that allows provisioning of the assessment images S3 bucket in the Images account. | `string` | `"ProvisionAssessmentImagesBucket"` | no |
| read\_terraform\_state\_role\_name | The name to associate with the IAM role and attached policy that allows read-only access to the cool-images-assessment-images state in the S3 bucket where Terraform state is stored. | `string` | `"ReadImagesAssessmentImagesTerraformState"` | no |
| tags | Tags to apply to all AWS resources created. | `map(string)` | `{}` | no |

## Outputs ##

| Name | Description |
|------|-------------|
| assessment\_images\_bucket\_production | The S3 bucket to store assessment images in the Images (Production) account. |
| assessment\_images\_bucket\_staging | The S3 bucket to store assessment images in the Images (Staging) account. |
| assessmentimagesbucketfullaccess\_role\_production | The IAM role that allows full access to the assessment images bucket in the Images (Production) account. |
| assessmentimagesbucketfullaccess\_role\_staging | The IAM role that allows full access to the assessment images bucket in the Images (Staging) account. |
| read\_terraform\_state | The IAM policies and role that allow read-only access to the cool-images-assessment-images state in the Terraform state bucket. |
<!-- END_TF_DOCS -->

## Notes ##

Running `pre-commit` requires running `terraform init` in every directory that
contains Terraform code. In this repository, this is only the main directory.

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
