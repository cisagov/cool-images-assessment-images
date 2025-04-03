# ------------------------------------------------------------------------------
# Create the IAM role that allows full access to the assessment images bucket in
# the Images account.
# ------------------------------------------------------------------------------

resource "aws_iam_role" "fullaccess" {
  provider = aws.images

  assume_role_policy   = data.aws_iam_policy_document.assume_role.json
  description          = var.assessmentimagesbucketfullaccess_role_description
  max_session_duration = var.assessmentimagesbucketfullaccess_role_session_max_duration
  name                 = var.assessmentimagesbucketfullaccess_role_name
}

resource "aws_iam_role_policy_attachment" "fullaccess" {
  provider = aws.images

  policy_arn = aws_iam_policy.fullaccess.arn
  role       = aws_iam_role.fullaccess.name
}
