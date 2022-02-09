# ------------------------------------------------------------------------------
# Create the IAM policy that allows provisioning of the assessment images bucket
# in the Images account for the current workspace.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "provision_bucket" {
  statement {
    actions = [
      "s3:*",
    ]

    resources = [
      "arn:aws:s3:::${local.bucket_name}"
    ]
  }
}

resource "aws_iam_policy" "provision_bucket" {
  provider = aws.images

  description = var.provisionassessmentimagesbucket_policy_description
  name        = var.provisionassessmentimagesbucket_policy_name
  policy      = data.aws_iam_policy_document.provision_bucket.json
}
