resource "aws_cognito_user_pool" "ajalah_user_pool" {
  name = var.user_pool_name

  auto_verified_attributes = ["email"]

  password_policy {
    minimum_length    = 8
    require_uppercase = true
    require_lowercase = true
    require_numbers   = true
    require_symbols   = false
  }

  tags = {
    Name = var.user_pool_name
  }
}

resource "aws_cognito_user_pool_client" "ajalah_user_pool_client" {
  name         = var.user_pool_client_name
  user_pool_id = aws_cognito_user_pool.ajalah_user_pool.id

  explicit_auth_flows = [
    "ALLOW_ADMIN_USER_PASSWORD_AUTH",
    "ALLOW_USER_SRP_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH"
  ]
}

resource "aws_cognito_user_pool_domain" "ajalah_user_pool_domain" {
  domain       = var.user_pool_domain
  user_pool_id = aws_cognito_user_pool.ajalah_user_pool.id
}
