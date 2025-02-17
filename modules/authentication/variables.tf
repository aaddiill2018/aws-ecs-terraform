variable "user_pool_name" {
  description = "Name of the Cognito User Pool"
  type        = string
  default     = "ajalah-prod-user-pool"
}

variable "user_pool_client_name" {
  description = "Name of the Cognito User Pool Client"
  type        = string
  default     = "ajalah-prod-user-pool-client"
}

variable "user_pool_domain" {
  description = "Domain for the Cognito User Pool"
  type        = string
  default     = "ajalah-prod-auth"
}
