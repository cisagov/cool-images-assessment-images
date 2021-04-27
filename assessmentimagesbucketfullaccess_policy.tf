# ------------------------------------------------------------------------------
# Create the IAM policies that allows full access to the assessment images
# buckets in the Images (Production) and Images (Staging) accounts.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "assessmentimagesbucketfullaccess_policy_production_doc" {
  statement {
    actions = [
      "s3:ListBucket",
    ]
    resources = [
      aws_s3_bucket.assessment_images_production.arn
    ]
  }

  statement {
    actions = [
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:PutObject",
    ]
    resources = [
      "${aws_s3_bucket.assessment_images_production.arn}/*"
    ]
  }
}

data "aws_iam_policy_document" "assessmentimagesbucketfullaccess_policy_staging_doc" {
  statement {
    actions = [
      "s3:ListBucket",
    ]
    resources = [
      aws_s3_bucket.assessment_images_staging.arn
    ]
  }

  statement {
    actions = [
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:PutObject",
    ]
    resources = [
      "${aws_s3_bucket.assessment_images_staging.arn}/*"
    ]
  }
}

resource "aws_iam_policy" "assessmentimagesbucketfullaccess_policy_production" {
  provider = aws.images_provisionaccount_production

  description = var.assessmentimagesbucketfullaccess_role_description
  name        = var.assessmentimagesbucketfullaccess_role_name
  policy      = data.aws_iam_policy_document.assessmentimagesbucketfullaccess_policy_production_doc.json
}

resource "aws_iam_policy" "assessmentimagesbucketfullaccess_policy_staging" {
  provider = aws.images_provisionaccount_staging

  description = var.assessmentimagesbucketfullaccess_role_description
  name        = var.assessmentimagesbucketfullaccess_role_name
  policy      = data.aws_iam_policy_document.assessmentimagesbucketfullaccess_policy_staging_doc.json
}
