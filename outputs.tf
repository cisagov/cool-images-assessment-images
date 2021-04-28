output "assessment_images_bucket_production" {
  value       = aws_s3_bucket.assessment_images_production
  description = "The S3 bucket to store assessment images in the Images (Production) account."
}

output "assessment_images_bucket_staging" {
  value       = aws_s3_bucket.assessment_images_staging
  description = "The S3 bucket to store assessment images in the Images (Staging) account."
}

output "assessmentimagesbucketfullaccess_role_production" {
  value       = aws_iam_role.assessmentimagesbucketfullaccess_role_production
  description = "The IAM role that allows full access to the assessment images bucket in the Images (Production) account."
}

output "assessmentimagesbucketfullaccess_role_staging" {
  value       = aws_iam_role.assessmentimagesbucketfullaccess_role_staging
  description = "The IAM role that allows full access to the assessment images bucket in the Images (Staging) account."
}

output "assume_access_role_policy" {
  value       = aws_iam_policy.assume_bucket_role_policy
  description = "The IAM policy that allows the user in the Users account to assume the IAM roles that allow access to the assessment images buckets in the Images (Production) and Images (Staging) accounts."
}

output "bucket_access_key" {
  value       = aws_iam_access_key.key
  description = "The access key associated with the assessment images buckets user."
  sensitive   = true
}

output "bucket_user" {
  value       = aws_iam_user.user
  description = "The user in the Users account with full access permissions to the assessment images buckets in the Images (Production) and Images (Staging) accounts."
}

output "read_terraform_state" {
  value       = module.read_terraform_state
  description = "The IAM policies and role that allow read-only access to the cool-images-assessment-images state in the Terraform state bucket."
}
