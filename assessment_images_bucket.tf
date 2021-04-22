# ------------------------------------------------------------------------------
# Create S3 buckets to store assessment images.
# ------------------------------------------------------------------------------

resource "aws_s3_bucket" "assessment_images_production" {
  acl    = "private"
  bucket = local.production_bucket_name

  # Until this policy attachment happens, we don't have permission
  # to provision the bucket.
  depends_on = [
    aws_iam_role_policy_attachment.provisionassessmentimagesbucket_policy_attachment_production
  ]

  provider = aws.images_provisionaccount_production

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = var.tags

  versioning {
    enabled = true
  }
}

# This blocks ANY public access to the bucket or the objects it
# contains, even if misconfigured to allow public access.
resource "aws_s3_bucket_public_access_block" "assessment_images_production" {
  provider = aws.images_provisionaccount_production

  bucket = aws_s3_bucket.assessment_images_production.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket" "assessment_images_staging" {
  acl    = "private"
  bucket = local.staging_bucket_name

  # Until this policy attachment happens, we don't have permission
  # to provision the bucket.
  depends_on = [
    aws_iam_role_policy_attachment.provisionassessmentimagesbucket_policy_attachment_staging
  ]

  provider = aws.images_provisionaccount_staging

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = var.tags

  versioning {
    enabled = true
  }
}

# This blocks ANY public access to the bucket or the objects it
# contains, even if misconfigured to allow public access.
resource "aws_s3_bucket_public_access_block" "assessment_images_staging" {
  provider = aws.images_provisionaccount_staging

  bucket = aws_s3_bucket.assessment_images_staging.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
