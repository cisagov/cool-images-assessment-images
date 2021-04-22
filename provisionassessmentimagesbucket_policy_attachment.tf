# ------------------------------------------------------------------------------
# Attach to the ProvisionAccount role the IAM policy that allows provisioning of
# the assessment images bucket in the Images (Production) and Images (Staging)
# accounts.
# ------------------------------------------------------------------------------

resource "aws_iam_role_policy_attachment" "provisionassessmentimagesbucket_policy_attachment_production" {
  provider = aws.images_provisionaccount_production

  policy_arn = aws_iam_policy.provisionassessmentimagesbucket_policy_production.arn
  role       = var.provisionaccount_role_name
}

resource "aws_iam_role_policy_attachment" "provisionassessmentimagesbucket_policy_attachment_staging" {
  provider = aws.images_provisionaccount_staging

  policy_arn = aws_iam_policy.provisionassessmentimagesbucket_policy_staging.arn
  role       = var.provisionaccount_role_name
}
