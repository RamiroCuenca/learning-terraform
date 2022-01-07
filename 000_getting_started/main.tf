# Search for a provider at https://registry.terraform.io/
terraform {
    backend "remote" {
        hostname = "app.terraform.io"
        organization = "ramirocuenca"

        workspaces {
            name = "getting-started"
        }
    }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.70.0"
    }
  }
}

locals {
  # similar to input variables but hardcoded in the code
  instance_ami = "0ed9277fb7eb570c9" # Check the region because it's different in each region!
}