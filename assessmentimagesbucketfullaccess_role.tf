# ------------------------------------------------------------------------------
# Create the IAM roles that allow full access to the assessment images bucket.
# ------------------------------------------------------------------------------

resource "aws_iam_role" "fullaccess_role" {
  provider = aws.images

  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  description        = var.assessmentimagesbucketfullaccess_role_description
  name               = var.assessmentimagesbucketfullaccess_role_name
}

resource "aws_iam_role_policy_attachment" "fullaccess_role" {
  provider = aws.images

  policy_arn = aws_iam_policy.fullaccess_policy.arn
  role       = aws_iam_role.fullaccess_role.name
}
