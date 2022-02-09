# ------------------------------------------------------------------------------
# Attach to the ProvisionAccount role the IAM policy that allows provisioning of
# the assessment images bucket in the Images account for the current workspace.
# ------------------------------------------------------------------------------

resource "aws_iam_role_policy_attachment" "provision_bucket" {
  provider = aws.images

  policy_arn = aws_iam_policy.provision_bucket.arn
  role       = data.terraform_remote_state.images.outputs.provisionaccount_role.name
}
