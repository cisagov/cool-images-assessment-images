# ------------------------------------------------------------------------------
# Create the IAM policy that allows provisioning of the assessment images bucket
# in the Images (Production) and Images (Staging) accounts.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "provision_buckets_production" {
  statement {
    actions = [
      "s3:*",
    ]

    resources = [
      "arn:aws:s3:::${local.production_bucket_name}"
    ]
  }
}

data "aws_iam_policy_document" "provision_buckets_staging" {
  statement {
    actions = [
      "s3:*",
    ]

    resources = [
      "arn:aws:s3:::${local.staging_bucket_name}"
    ]
  }
}

resource "aws_iam_policy" "provision_buckets_production" {
  provider = aws.images_production

  description = var.provisionassessmentimagesbucket_policy_description
  name        = var.provisionassessmentimagesbucket_policy_name
  policy      = data.aws_iam_policy_document.provision_buckets_production.json
}

resource "aws_iam_policy" "provision_buckets_staging" {
  provider = aws.images_staging

  description = var.provisionassessmentimagesbucket_policy_description
  name        = var.provisionassessmentimagesbucket_policy_name
  policy      = data.aws_iam_policy_document.provision_buckets_staging.json
}
