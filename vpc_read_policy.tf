# ------------------------------------------------------------------------------
# Create the S3 bucket policy that allows read access to the assessment images
# bucket in the Images account from the VPC in the Shared Services account.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "vpcreadaccess_policy" {
  statement {
    actions = [
      "s3:ListBucket",
    ]
    resources = [
      aws_s3_bucket.assessment_images.arn
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:SourceVpce"

      values = [
        data.terraform_remote_state.sharedservices_networking.outputs.vpc_endpoint_s3.id,
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
      "${aws_s3_bucket.assessment_images.arn}/*"
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:SourceVpce"

      values = [
        data.terraform_remote_state.sharedservices_networking.outputs.vpc_endpoint_s3.id,
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

resource "aws_s3_bucket_policy" "vpcreadaccess_policy" {
  provider = aws.images

  bucket = aws_s3_bucket.assessment_images.id
  policy = data.aws_iam_policy_document.vpcreadaccess_policy.json
}
