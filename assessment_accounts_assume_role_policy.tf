# ------------------------------------------------------------------------------
# Create an IAM policy document that allows the dynamic assessment accounts to
# assume a role.
# ------------------------------------------------------------------------------

data "aws_iam_policy_document" "assessment_account_assume_role_doc" {
  statement {
    actions = [
      "sts:AssumeRole",
      "sts:TagSession",
    ]
    effect = "Allow"
    principals {
      identifiers = local.assessment_account_ids
      type        = "AWS"
    }
  }

  lifecycle {
    precondition {
      condition     = length(local.assessment_account_ids) > 0
      error_message = "No assessment accounts were discovered. local.assessment_account_ids must contain at least one AWS account ID before creating the assume role policy."
    }
  }
}
