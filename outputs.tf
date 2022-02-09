output "assessment_images_bucket_production" {
  value       = aws_s3_bucket.production
  description = "The S3 bucket to store assessment images in the Images (Production) account."
}

output "assessmentimagesbucketfullaccess_role_production" {
  value       = aws_iam_role.fullaccess_role_production
  description = "The IAM role that allows full access to the assessment images bucket in the Images (Production) account."
}

output "read_terraform_state" {
  value       = module.read_terraform_state
  description = "The IAM policies and role that allow read-only access to the cool-images-assessment-images state in the Terraform state bucket."
}
