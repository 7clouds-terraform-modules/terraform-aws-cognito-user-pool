module "cognito_user_pool" {
  source         = "../.."
  USER_POOL_NAME = "cognito_example_user_pool"
  PROJECT_NAME   = "ExampleProject"
}
