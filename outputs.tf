output "assessment_images_bucket" {
  description = "The S3 bucket to store assessment images in the Images account."
  value       = aws_s3_bucket.assessment_images
}

output "assessmentimagesbucketfullaccess_role" {
  description = "The IAM role that allows full access to the assessment images bucket in the Images account."
  value       = aws_iam_role.fullaccess
}

output "read_terraform_state" {
  description = "The IAM policies and role that allow read-only access to the cool-images-assessment-images state in the Terraform state bucket."
  value       = module.read_terraform_state
}
