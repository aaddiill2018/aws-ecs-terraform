terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.86"
    }
  }

  backend "s3" {
    bucket         = "ajalah-terraform-state"
    key            = "infra/terraform.tfstate"
    region         = "me-south-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}

provider "aws" {
  region = "me-south-1"
  access_key = ""
  secret_key = ""

}