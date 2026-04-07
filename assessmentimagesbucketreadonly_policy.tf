# ------------------------------------------------------------------------------
# Create the IAM policy that allows read-only access to the assessment images
# bucket in the Images account.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "readonly" {
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
      "s3:GetObject*",
    ]
    resources = [
      "${aws_s3_bucket.assessment_images.arn}/*"
    ]
  }
}

resource "aws_iam_policy" "readonly" {
  provider = aws.images

  description = var.assessmentimagesbucketreadonly_role_description
  name        = var.assessmentimagesbucketreadonly_role_name
  policy      = data.aws_iam_policy_document.readonly.json
}
