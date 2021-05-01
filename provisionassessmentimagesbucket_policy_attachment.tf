# ------------------------------------------------------------------------------
# Attach to the ProvisionAccount role the IAM policy that allows provisioning of
# the assessment images bucket in the Images (Production) and Images (Staging)
# accounts.
# ------------------------------------------------------------------------------

resource "aws_iam_role_policy_attachment" "provision_bucket_production" {
  provider = aws.images_production

  policy_arn = aws_iam_policy.provision_bucket_production.arn
  role       = var.provisionaccount_role_name
}

resource "aws_iam_role_policy_attachment" "provision_bucket_staging" {
  provider = aws.images_staging

  policy_arn = aws_iam_policy.provision_bucket_staging.arn
  role       = var.provisionaccount_role_name
}
