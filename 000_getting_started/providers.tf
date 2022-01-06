# Search for a provider at https://registry.terraform.io/
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.70.0"
    }
  }
}

# Config an AWS profile for terraform -> aws config --profile terraform
provider "aws" {
  profile = "terraform"
  region  = "us-east-1"
}