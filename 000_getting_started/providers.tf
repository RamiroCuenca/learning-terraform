# Config an AWS profile for terraform -> aws config --profile terraform
provider "aws" {
  profile = "terraform"
  region  = "us-east-1"
}