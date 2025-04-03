# ------------------------------------------------------------------------------
# Create the S3 bucket policy that allows read access to the assessment images
# bucket in the Images accounts from the VPC.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "vpcreadaccess" {
  statement {
    actions = [
      "s3:ListBucket",
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

    resources = [
      aws_s3_bucket.assessment_images.arn
    ]
  }

  statement {
    actions = [
      "s3:GetObject",
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

    resources = [
      "${aws_s3_bucket.assessment_images.arn}/*"
    ]
  }
}

resource "aws_s3_bucket_policy" "vpcreadaccess" {
  provider = aws.images

  bucket = aws_s3_bucket.assessment_images.id
  policy = data.aws_iam_policy_document.vpcreadaccess.json
}
