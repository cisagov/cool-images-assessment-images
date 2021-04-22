output "assessment_images_bucket_production" {
  value       = aws_s3_bucket.assessment_images_production
  description = "The S3 bucket to store assessment images in the Images (Production) account."
}

output "assessment_images_bucket_staging" {
  value       = aws_s3_bucket.assessment_images_staging
  description = "The S3 bucket to store assessment images in the Images (Staging) account."
}

output "read_terraform_state" {
  value       = module.read_terraform_state
  description = "The IAM policies and role that allow read-only access to the cool-images-assessment-images state in the Terraform state bucket."
}
