# ------------------------------------------------------------------------------
# Create the IAM role that allows read-only access to the assessment images
# bucket in the Images account.  Note that this role can be assumed by any of
# the dynamic assessment accounts.
# ------------------------------------------------------------------------------

resource "aws_iam_role" "readonly" {
  provider = aws.images

  assume_role_policy   = data.aws_iam_policy_document.assessment_account_assume_role_doc.json
  description          = var.assessmentimagesbucketreadonly_role_description
  max_session_duration = var.assessmentimagesbucketreadonly_role_session_max_duration
  name                 = var.assessmentimagesbucketreadonly_role_name
}

resource "aws_iam_role_policy_attachment" "readonly" {
  provider = aws.images

  policy_arn = aws_iam_policy.readonly.arn
  role       = aws_iam_role.readonly.name
}
