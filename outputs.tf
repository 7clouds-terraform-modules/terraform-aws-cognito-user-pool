output "USER_POOL_ID" {
  value = aws_cognito_user_pool.this.id
}

output "USER_POOL_NAME" {
  value = aws_cognito_user_pool.this.name
}

output "USER_POOL_ARN" {
  value = aws_cognito_user_pool.this.arn
}

output "USER_POOL_ENDPOINT" {
  value = aws_cognito_user_pool.this.endpoint
}

output "PROJECT_NAME" {
  value = var.PROJECT_NAME
}

output "TAGS" {
  value = var.TAGS
}
