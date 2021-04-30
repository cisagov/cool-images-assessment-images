# ------------------------------------------------------------------------------
# Create the IAM policies that allows full access to the assessment images
# buckets in the Images (Production) and Images (Staging) accounts.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "fullaccess_policy_production" {
  statement {
    actions = [
      "s3:ListBucket",
    ]
    resources = [
      aws_s3_bucket.production.arn
    ]
  }

  statement {
    actions = [
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:PutObject",
    ]
    resources = [
      "${aws_s3_bucket.production.arn}/*"
    ]
  }
}

data "aws_iam_policy_document" "fullaccess_policy_staging" {
  statement {
    actions = [
      "s3:ListBucket",
    ]
    resources = [
      aws_s3_bucket.staging.arn
    ]
  }

  statement {
    actions = [
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:PutObject",
    ]
    resources = [
      "${aws_s3_bucket.staging.arn}/*"
    ]
  }
}

resource "aws_iam_policy" "fullaccess_policy_production" {
  provider = aws.images_production

  description = var.assessmentimagesbucketfullaccess_role_description
  name        = var.assessmentimagesbucketfullaccess_role_name
  policy      = data.aws_iam_policy_document.fullaccess_policy_production.json
}

resource "aws_iam_policy" "fullaccess_policy_staging" {
  provider = aws.images_staging

  description = var.assessmentimagesbucketfullaccess_role_description
  name        = var.assessmentimagesbucketfullaccess_role_name
  policy      = data.aws_iam_policy_document.fullaccess_policy_staging.json
}
