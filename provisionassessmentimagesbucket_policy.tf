# ------------------------------------------------------------------------------
# Create the IAM policy that allows provisioning of the assessment images bucket
# in the Images (Production) account.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "provision_bucket_production" {
  statement {
    actions = [
      "s3:*",
    ]

    resources = [
      "arn:aws:s3:::${local.production_bucket_name}"
    ]
  }
}

resource "aws_iam_policy" "provision_bucket_production" {
  provider = aws.images_production

  description = var.provisionassessmentimagesbucket_policy_description
  name        = var.provisionassessmentimagesbucket_policy_name
  policy      = data.aws_iam_policy_document.provision_bucket_production.json
}
