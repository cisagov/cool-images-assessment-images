# ------------------------------------------------------------------------------
# Create the S3 bucket policy that allows read access to the assessment images
# bucket in the Images (Production) account from the VPC in the production
# workspace.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "vpcreadaccess_policy_production" {
  statement {
    actions = [
      "s3:ListBucket",
    ]
    resources = [
      aws_s3_bucket.production.arn
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:SourceVpce"

      values = [
        data.terraform_remote_state.sharedservices_networking_production.outputs.vpc_endpoint_s3.id,
      ]
    }

    principals {
      type = "AWS"
      identifiers = [
        "*",
      ]
    }
  }

  statement {
    actions = [
      "s3:GetObject",
    ]
    resources = [
      "${aws_s3_bucket.production.arn}/*"
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:SourceVpce"

      values = [
        data.terraform_remote_state.sharedservices_networking_production.outputs.vpc_endpoint_s3.id,
      ]
    }

    principals {
      type = "AWS"
      identifiers = [
        "*",
      ]
    }
  }
}

resource "aws_s3_bucket_policy" "vpcreadaccess_policy_production" {
  provider = aws.images_production

  bucket = aws_s3_bucket.production.id
  policy = data.aws_iam_policy_document.vpcreadaccess_policy_production.json
}
