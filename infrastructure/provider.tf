provider "aws" {
region = var.region
shared_credentials_file = "~/.aws/credentials"
profile = "caltuco_aws"
}


terraform {
  required_version = ">= 0.13.4"

  required_providers {
    aws = ">= 3.15.0"
  }
  
  backend "s3" {
    bucket = "tf-state-caltuco"
    key    = "terraform/terraform.tfstate"
    dynamodb_table = "terraform-state-lock"
    region = "us-east-1"
    shared_credentials_file = "~/.aws/credentials"
    profile                 = "caltuco_aws"
    encrypt = true

  }
}
