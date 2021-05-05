# ------------------------------------------------------------------------------
# Create the IAM roles that allow full access to the assessment images
# buckets in the Images (Production) and Images (Staging) accounts.
# ------------------------------------------------------------------------------

resource "aws_iam_role" "fullaccess_role_production" {
  provider = aws.images_production

  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  description        = var.assessmentimagesbucketfullaccess_role_description
  name               = var.assessmentimagesbucketfullaccess_role_name
  tags               = merge(var.tags, { "Workspace" = "production" })
}

resource "aws_iam_role_policy_attachment" "fullaccess_role_production" {
  provider = aws.images_production

  policy_arn = aws_iam_policy.fullaccess_policy_production.arn
  role       = aws_iam_role.fullaccess_role_production.name
}

resource "aws_iam_role" "fullaccess_role_staging" {
  provider = aws.images_staging

  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  description        = var.assessmentimagesbucketfullaccess_role_description
  name               = var.assessmentimagesbucketfullaccess_role_name
  tags               = merge(var.tags, { "Workspace" = "staging" })
}

resource "aws_iam_role_policy_attachment" "fullaccess_role_staging" {
  provider = aws.images_staging

  policy_arn = aws_iam_policy.fullaccess_policy_staging.arn
  role       = aws_iam_role.fullaccess_role_staging.name
}
