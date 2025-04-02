# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "terraform_state_bucket" {
  description = "The name of the S3 bucket where Terraform state is stored."
  type        = string
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------
variable "assessment_images_bucket_base_name" {
  default     = "cisa-cool-assessment-images"
  description = "The base name to use for the assessment images S3 buckets. This value will be appended with \"-production\" or \"-staging\" to create the appropriate full bucket name (e.g. With the default value \"cisa-cool-assessment-images-production\" will be used for the bucket in the Images (Production) account)."
  nullable    = false
  type        = string
}

variable "assessmentimagesbucketfullaccess_role_description" {
  default     = "Allows full access to the S3 bucket where assessment images are stored."
  description = "The description to associate with the IAM role and attached policy that allows full access to the assessment images S3 bucket."
  nullable    = false
  type        = string
}

variable "assessmentimagesbucketfullaccess_role_session_max_duration" {
  default     = 43200
  description = "The maximum duration in seconds to allow a session that assumes the IAM role that allows full access to the assessment images S3 bucket. The default is the maximum of 12 hours due to using the AWS console to upload objects to the bucket."
  nullable    = false
  type        = number
}

variable "assessmentimagesbucketfullaccess_role_name" {
  default     = "AssessmentImagesBucketFullAccess"
  description = "The name to associate with the IAM role and attached policy that allows full access to the assessment images S3 bucket."
  nullable    = false
  type        = string
}

variable "aws_region" {
  default     = "us-east-1"
  description = "The AWS region to use for the account provisioners (e.g. \"us-east-1\")."
  nullable    = false
  type        = string
}

variable "provisionassessmentimagesbucket_policy_description" {
  default     = "Allows provisioning of assessment images S3 resources in the Images account."
  description = "The description to associate with the IAM policy that allows provisioning of the assessment images S3 bucket in the Images account."
  nullable    = false
  type        = string
}

variable "provisionassessmentimagesbucket_policy_name" {
  default     = "ProvisionAssessmentImagesBucket"
  description = "The name to associate with the IAM policy that allows provisioning of the assessment images S3 bucket in the Images account."
  nullable    = false
  type        = string
}

variable "read_terraform_state_role_name" {
  default     = "ReadImagesAssessmentImagesTerraformState"
  description = "The name to associate with the IAM role and attached policy that allows read-only access to the cool-images-assessment-images state in the S3 bucket where Terraform state is stored."
  nullable    = false
  type        = string
}

variable "tags" {
  default     = {}
  description = "Tags to apply to all AWS resources created."
  nullable    = false
  type        = map(string)
}
