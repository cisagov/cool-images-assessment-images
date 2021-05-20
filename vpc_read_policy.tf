# ------------------------------------------------------------------------------
# Create the S3 bucket policies that allow read access to the assessment images
# buckets in the Images (Production) and Images (Staging) accounts from the VPCs
# for their respective workspaces.
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
  }
}

data "aws_iam_policy_document" "vpcreadaccess_policy_staging" {
  statement {
    actions = [
      "s3:ListBucket",
    ]
    resources = [
      aws_s3_bucket.staging.arn
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:SourceVpce"

      values = [
        data.terraform_remote_state.sharedservices_networking_staging.outputs.vpc_endpoint_s3.id,
      ]
    }
  }

  statement {
    actions = [
      "s3:GetObject",
    ]
    resources = [
      "${aws_s3_bucket.staging.arn}/*"
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:SourceVpce"

      values = [
        data.terraform_remote_state.sharedservices_networking_staging.outputs.vpc_endpoint_s3.id,
      ]
    }
  }
}

resource "aws_s3_bucket_policy" "vpcreadaccess_policy_production" {
  provider = aws.images_production

  bucket = aws_s3_bucket.production.id
  policy = data.aws_iam_policy_document.vpcreadaccess_policy_production.json
}

resource "aws_s3_bucket_policy" "vpcreadaccess_policy_staging" {
  provider = aws.images_staging

  bucket = aws_s3_bucket.staging.id
  policy = data.aws_iam_policy_document.vpcreadaccess_policy_staging.json
}
