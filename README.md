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

## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 0.12.0 |
| aws | ~> 3.0 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 3.0 |
| aws.images\_provisionaccount\_production | ~> 3.0 |
| aws.images\_provisionaccount\_staging | ~> 3.0 |
| aws.users\_provisionaccount | ~> 3.0 |
| terraform | n/a |

## Modules ##

| Name | Source | Version |
|------|--------|---------|
| read\_terraform\_state | github.com/cisagov/terraform-state-read-role-tf-module |  |

## Resources ##

| Name | Type |
|------|------|
| [aws_iam_access_key.key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_policy.assessmentimagesbucketfullaccess_policy_production](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.assessmentimagesbucketfullaccess_policy_staging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.assume_bucket_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.provisionassessmentimagesbucket_policy_production](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.provisionassessmentimagesbucket_policy_staging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.assessmentimagesbucketfullaccess_role_production](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.assessmentimagesbucketfullaccess_role_staging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.assessmentimagesbucketfullaccess_policy_attachment_production](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.assessmentimagesbucketfullaccess_policy_attachment_staging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.provisionassessmentimagesbucket_policy_attachment_production](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.provisionassessmentimagesbucket_policy_attachment_staging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_user.user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy_attachment.assume_bucket_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_s3_bucket.assessment_images_production](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.assessment_images_staging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.assessment_images_production](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_public_access_block.assessment_images_staging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_caller_identity.users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assessmentimagesbucketfullaccess_policy_production_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.assessmentimagesbucketfullaccess_policy_staging_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.assume_bucket_role_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.assume_role_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.provisionassessmentimagesbucket_policy_production_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.provisionassessmentimagesbucket_policy_staging_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [terraform_remote_state.images_production](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.images_staging](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.terraform](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.users](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| assessment\_images\_bucket\_name | The base name to use for the assessment images S3 buckets. | `string` | `"cisa-cool-assessment-images"` | no |
| assessmentimagesbucketfullaccess\_role\_description | The description to associate with the IAM role (as well as the corresponding policy) that allows full access to the S3 bucket where assessment images are stored. | `string` | `"Allows full access to the S3 bucket where assessment images are stored."` | no |
| assessmentimagesbucketfullaccess\_role\_name | The name to assign the IAM role (as well as the corresponding policy) that allows full access to the S3 bucket where assessment images are stored. | `string` | `"AssessmentImagesBucketFullAccess"` | no |
| assume\_bucket\_role\_policy\_description | The description to associate with the IAM policy that allows the user in the Users account to assume the IAM role that allows access to the assessment images buckets in the Images (Production) and Images (Staging) accounts. | `string` | `"Allows assumption of the roles in the Images (Production) and Images (Staging) accounts that allows full access to the assessment images buckets."` | no |
| aws\_region | The AWS region where the Images account is to be created (e.g. "us-east-1"). | `string` | `"us-east-1"` | no |
| provisionaccount\_role\_name | The name of the IAM role that allows sufficient permission to provision all AWS resources in the Images account. | `string` | `"ProvisionAccount"` | no |
| provisionassessmentimagesbucket\_policy\_description | The description to associate with the IAM policy that allows provisioning of S3 buckets in the Images account. | `string` | `"Allows provisioning of S3 buckets in the Images account."` | no |
| provisionassessmentimagesbucket\_policy\_name | The name to assign the IAM policy that allows provisioning of S3 buckets in the Images account. | `string` | `"ProvisionBuckets"` | no |
| read\_terraform\_state\_role\_name | The name to assign the IAM role (as well as the corresponding policy) that allows read-only access to the cool-images-assessment-images state in the S3 bucket where Terraform state is stored. | `string` | `"ReadImagesAssessmentImagesTerraformState"` | no |
| tags | Tags to apply to all AWS resources created | `map(string)` | `{}` | no |
| user\_name | The name of the user to create in the Users account which will have the policy to assume roles allowing access to the assessment images buckets in the Images (Production) and Images (Staging) accounts attached. | `string` | `"assessment-images-bucket-full-access"` | no |

## Outputs ##

| Name | Description |
|------|-------------|
| assessment\_images\_bucket\_production | The S3 bucket to store assessment images in the Images (Production) account. |
| assessment\_images\_bucket\_staging | The S3 bucket to store assessment images in the Images (Staging) account. |
| assessmentimagesbucketfullaccess\_role\_production | The IAM role that allows full access to the assessment images bucket in the Images (Production) account. |
| assessmentimagesbucketfullaccess\_role\_staging | The IAM role that allows full access to the assessment images bucket in the Images (Staging) account. |
| assume\_access\_role\_policy | The IAM policy that allows the user in the Users account to assume the IAM roles that allow access to the assessment images buckets in the Images (Production) and Images (Staging) accounts. |
| bucket\_access\_key | The access key associated with the assessment images buckets user. |
| bucket\_user | The user in the Users account with full access permissions to the assessment images buckets in the Images (Production) and Images (Staging) accounts. |
| read\_terraform\_state | The IAM policies and role that allow read-only access to the cool-images-assessment-images state in the Terraform state bucket. |

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
