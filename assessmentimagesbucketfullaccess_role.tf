# ------------------------------------------------------------------------------
# Create the IAM role that allows full access to the assessment images
# buckets in the Images (Production) and Images (Staging) accounts.
# ------------------------------------------------------------------------------

resource "aws_iam_role" "assessmentimagesbucketfullaccess_role_production" {
  provider = aws.images_provisionaccount_production

  assume_role_policy = data.aws_iam_policy_document.assume_role_doc.json
  description        = var.assessmentimagesbucketfullaccess_role_description
  name               = var.assessmentimagesbucketfullaccess_role_name
  tags               = merge(var.tags, { "Workspace" = "production" })
}

resource "aws_iam_role_policy_attachment" "assessmentimagesbucketfullaccess_policy_attachment_production" {
  provider = aws.images_provisionaccount_production

  policy_arn = aws_iam_policy.assessmentimagesbucketfullaccess_policy_production.arn
  role       = aws_iam_role.assessmentimagesbucketfullaccess_role_production.name
}

resource "aws_iam_role" "assessmentimagesbucketfullaccess_role_staging" {
  provider = aws.images_provisionaccount_staging

  assume_role_policy = data.aws_iam_policy_document.assume_role_doc.json
  description        = var.assessmentimagesbucketfullaccess_role_description
  name               = var.assessmentimagesbucketfullaccess_role_name
  tags               = merge(var.tags, { "Workspace" = "staging" })
}

resource "aws_iam_role_policy_attachment" "assessmentimagesbucketfullaccess_policy_attachment_staging" {
  provider = aws.images_provisionaccount_staging

  policy_arn = aws_iam_policy.assessmentimagesbucketfullaccess_policy_staging.arn
  role       = aws_iam_role.assessmentimagesbucketfullaccess_role_staging.name
}
