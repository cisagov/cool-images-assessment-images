# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------
variable "assessment_images_bucket_base_name" {
  type        = string
  description = "The base name to use for the assessment images S3 buckets. This value will be appended with \"-production\" or \"-staging\" to create the appropriate full bucket name (e.g. With the default value \"cisa-cool-assessment-images-production\" will be used for the bucket in the Images (Production) account)."
  default     = "cisa-cool-assessment-images"
}

variable "assessmentimagesbucketfullaccess_role_description" {
  type        = string
  description = "The description to associate with the IAM role and attached policy that allows full access to the assessment images S3 bucket."
  default     = "Allows full access to the S3 bucket where assessment images are stored."
}

variable "assessmentimagesbucketfullaccess_role_name" {
  type        = string
  description = "The name to associate with the IAM role and attached policy that allows full access to the assessment images S3 bucket."
  default     = "AssessmentImagesBucketFullAccess"
}

variable "assume_assessmentimagesbucketfullaccess_roles_policy_description" {
  type        = string
  description = "The description to associate with the IAM policy that allows a user to assume the IAM roles that allow access to the assessment images S3 bucket in the Images (Production) and Images (Staging) accounts."
  default     = "Allows assumption of the roles in the Images (Production) and Images (Staging) accounts that allow full access to the assessment images S3 bucket."
}

variable "aws_region" {
  type        = string
  description = "The AWS region to use for the account provisioners (e.g. \"us-east-1\")."
  default     = "us-east-1"
}

variable "provisionassessmentimagesbucket_policy_description" {
  type        = string
  description = "The description to associate with the IAM policy that allows provisioning of the assessment images S3 bucket in the Images account."
  default     = "Allows provisioning of assessment images S3 resources in the Images account."
}

variable "provisionassessmentimagesbucket_policy_name" {
  type        = string
  description = "The name to associate with the IAM policy that allows provisioning of the assessment images S3 bucket in the Images account."
  default     = "ProvisionAssessmentImagesBucket"
}

variable "read_terraform_state_role_name" {
  type        = string
  description = "The name to associate with the IAM role and attached policy that allows read-only access to the cool-images-assessment-images state in the S3 bucket where Terraform state is stored."
  default     = "ReadImagesAssessmentImagesTerraformState"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created."
  default     = {}
}
