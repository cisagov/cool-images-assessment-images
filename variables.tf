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
variable "assessment_images_bucket_name" {
  type        = string
  description = "The base name to use for the assessment images S3 buckets."
  default     = "cisa-cool-assessment-images"
}

variable "assessmentimagesbucketfullaccess_role_description" {
  type        = string
  description = "The description to associate with the IAM role (as well as the corresponding policy) that allows full access to the S3 bucket where assessment images are stored."
  default     = "Allows full access to the S3 bucket where assessment images are stored."
}

variable "assessmentimagesbucketfullaccess_role_name" {
  type        = string
  description = "The name to assign the IAM role (as well as the corresponding policy) that allows full access to the S3 bucket where assessment images are stored."
  default     = "AssessmentImagesBucketFullAccess"
}

variable "assume_bucket_role_policy_description" {
  type        = string
  description = "The description to associate with the IAM policy that allows the user in the Users account to assume the IAM role that allows access to the assessment images buckets in the Images (Production) and Images (Staging) accounts."
  default     = "Allows assumption of the roles in the Images (Production) and Images (Staging) accounts that allows full access to the assessment images buckets."
}

variable "aws_region" {
  type        = string
  description = "The AWS region where the Images account is to be created (e.g. \"us-east-1\")."
  default     = "us-east-1"
}

variable "provisionaccount_role_name" {
  type        = string
  description = "The name of the IAM role that allows sufficient permission to provision all AWS resources in the Images account."
  default     = "ProvisionAccount"
}

variable "provisionassessmentimagesbucket_policy_description" {
  type        = string
  description = "The description to associate with the IAM policy that allows provisioning of S3 buckets in the Images account."
  default     = "Allows provisioning of S3 buckets in the Images account."
}

variable "provisionassessmentimagesbucket_policy_name" {
  type        = string
  description = "The name to assign the IAM policy that allows provisioning of S3 buckets in the Images account."
  default     = "ProvisionBuckets"
}

variable "read_terraform_state_role_name" {
  type        = string
  description = "The name to assign the IAM role (as well as the corresponding policy) that allows read-only access to the cool-images-assessment-images state in the S3 bucket where Terraform state is stored."
  default     = "ReadImagesAssessmentImagesTerraformState"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created"
  default     = {}
}

variable "user_name" {
  type        = string
  description = "The name of the user to create in the Users account which will have the policy to assume roles allowing access to the assessment images buckets in the Images (Production) and Images (Staging) accounts attached."
  default     = "assessment-images-bucket-full-access"
}
