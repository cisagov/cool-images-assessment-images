# ------------------------------------------------------------------------------
# Create the IAM policy that allows full access to the assessment images bucket.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "fullaccess_policy" {
  statement {
    actions = [
      "s3:ListBucket",
      "s3:ListBucketVersions",
    ]
    resources = [
      aws_s3_bucket.assessment_images.arn
    ]
  }

  statement {
    actions = [
      "s3:DeleteObject",
      "s3:DeleteObjectTagging",
      "s3:GetObject",
      "s3:GetObjectTagging",
      "s3:GetObjectVersion",
      "s3:PutObject",
      "s3:PutObjectTagging",
    ]
    resources = [
      "${aws_s3_bucket.assessment_images.arn}/*"
    ]
  }
}

resource "aws_iam_policy" "fullaccess_policy" {
  provider = aws.images

  description = var.assessmentimagesbucketfullaccess_role_description
  name        = var.assessmentimagesbucketfullaccess_role_name
  policy      = data.aws_iam_policy_document.fullaccess_policy.json
}
