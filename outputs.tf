output "assessment_images_bucket" {
  value       = aws_s3_bucket.assessment_images
  description = "The S3 bucket to store assessment images."
}

output "assessmentimagesbucketfullaccess_role" {
  value       = aws_iam_role.fullaccess_role
  description = "The IAM role that allows full access to the assessment images bucket."
}

output "read_terraform_state" {
  value       = module.read_terraform_state
  description = "The IAM policies and role that allow read-only access to the cool-images-assessment-images state in the Terraform state bucket."
}
