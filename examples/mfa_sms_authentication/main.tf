module "cognito_user_pool" {
  source            = "../.."
  USER_POOL_NAME    = "cognito_example_user_pool"
  PROJECT_NAME      = "ExampleProject"
  MFA_CONFIGURATION = "ON"
  ENABLE_SOFTWARE_TOKEN_MFA = [{
    enabled = true
  }]
  ALIAS_ATTRIBUTES = ["email", "phone_number"]
  SMS_CONFIGURATION = [{
    external_id    = "external-id-from-existing-assume-role-policy"
    sns_caller_arn = "existing_role_arn_for_sns_publish"
    sns_region     = "aws_region"
  }]
}
