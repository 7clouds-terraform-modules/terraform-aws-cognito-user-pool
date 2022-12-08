module "cognito_user_pool" {
  source         = "../.."
  USER_POOL_NAME = "cognito_example_user_pool"
  PROJECT_NAME   = "ExampleProject"
  LAMBDA_CONFIG = [{
    create_auth_challenge          = "respective_lambda_arn"
    custom_message                 = "respective_lambda_arn"
    define_auth_challenge          = "respective_lambda_arn"
    kms_key_id                     = "respective_lambda_arn"
    lambda_arn_email               = "respective_lambda_arn"
    lambda_arn_sms                 = "respective_lambda_arn"
    lambda_version_email           = "respective_lambda_arn"
    lambda_version_sms             = "respective_lambda_arn"
    post_authentication            = "respective_lambda_arn"
    post_confirmation              = "respective_lambda_arn"
    pre_authentication             = "respective_lambda_arn"
    pre_sign_up                    = "respective_lambda_arn"
    pre_token_generation           = "respective_lambda_arn"
    user_migration                 = "respective_lambda_arn"
    verify_auth_challenge_response = "respective_lambda_arn"
  }]
}
