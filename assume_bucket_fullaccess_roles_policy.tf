# ------------------------------------------------------------------------------
# Create an IAM policy document that allows the users account to
# assume this role.
# ------------------------------------------------------------------------------

# IAM policy document that allows assumption of the
# AssessmentImagesBucketFullAccess role in the Images (Production) and
# Images (Staging) accounts.
data "aws_iam_policy_document" "assume_bucket_fullaccess_roles" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
      "sts:TagSession",
    ]

    resources = [
      aws_iam_role.fullaccess_role_production.arn,
    ]
  }

  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
      "sts:TagSession",
    ]

    resources = [
      aws_iam_role.fullaccess_role_staging.arn,
    ]
  }
}

# Policy with the necessary permissions to assume the role that allows
# access to the assessment images buckets in the Images (Production) and
# Images (Staging) accounts.
resource "aws_iam_policy" "assume_bucket_fullaccess_roles" {
  provider = aws.users

  description = var.assume_bucket_role_policy_description
  name        = local.assume_bucket_role_policy_name
  policy      = data.aws_iam_policy_document.assume_bucket_fullaccess_roles.json
}

# The IAM policy that allows assumption of the AssessmentImagesBucketFullAccess
# role in the Images (Production) account.
resource "aws_iam_user_policy_attachment" "assume_bucket_fullaccess_roles" {
  provider = aws.users

  policy_arn = aws_iam_policy.assume_bucket_fullaccess_roles.arn
  user       = aws_iam_user.user.name
}
