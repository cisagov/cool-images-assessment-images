# ------------------------------------------------------------------------------
# Create an S3 bucket to store assessment images.
# ------------------------------------------------------------------------------

resource "aws_s3_bucket" "production" {
  provider = aws.images_production
  # Until this policy attachment happens, we don't have permission
  # to provision the bucket.
  depends_on = [
    aws_iam_role_policy_attachment.provision_bucket_production
  ]

  acl    = "private"
  bucket = local.production_bucket_name

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = { "Workspace" = "production" }

  versioning {
    enabled = true
  }
}

# This blocks ANY public access to the bucket or the objects it
# contains, even if misconfigured to allow public access.
resource "aws_s3_bucket_public_access_block" "production" {
  provider = aws.images_production

  bucket = aws_s3_bucket.production.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# This ensures every object in the bucket is owned by the bucket owner. This
# also disables access control lists (ACLs) and only allows access through
# policies (such as IAM policies).
resource "aws_s3_bucket_ownership_controls" "production" {
  provider = aws.images_production

  bucket = aws_s3_bucket.production.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}
