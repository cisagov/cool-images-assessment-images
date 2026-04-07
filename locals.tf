# ------------------------------------------------------------------------------
# Retrieve the effective Account ID, User ID, and ARN in which Terraform is
# authorized.  This is used to calculate the session names for assumed roles.
# ------------------------------------------------------------------------------
data "aws_caller_identity" "current" {}

# ------------------------------------------------------------------------------
# Retrieve the caller identity for the "users" provider in order to
# get the account ID associated with the Users account.
# ------------------------------------------------------------------------------
data "aws_caller_identity" "users" {
  provider = aws.users
}

# ------------------------------------------------------------------------------
# Retrieve the information for all accounts in the organization in order to
# get the account IDs of each dynamic assessment account.
# ------------------------------------------------------------------------------
data "aws_organizations_organization" "cool" {
  provider = aws.organizationsreadonly
}

# ------------------------------------------------------------------------------
# Evaluate expressions for use throughout this configuration.
# ------------------------------------------------------------------------------
locals {
  # Extract the user name of the current caller for use
  # as assume role session names.
  caller_user_name = split("/", data.aws_caller_identity.current.arn)[1]

  # Build a list of dynamic assessment account IDs whose account names match our
  # regex.
  assessment_account_ids = [
    for account in data.aws_organizations_organization.cool.non_master_accounts :
    account.id
  if length(regexall("^env[[:digit:]]+$", account.name)) > 0]

  # The account ID for the Users account
  users_account_id = data.aws_caller_identity.users.account_id
}
