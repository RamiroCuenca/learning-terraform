# Standard is that main.tf is the name of the file if it's a single file or if it's the entry point file.

# In each terraform file we have to import a provider and then we should create resources from it

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

# Define a variable
# Then, we will need to send through the CLI the value of this variable.
# $ terraform apply -var=instance_type="t2.micro" 
variable "instance_type" {
    type = string
}


resource "aws_instance" "my_server" {
  ami           = "ami-0ed9277fb7eb570c9" # Check the region because it's different in each region!
  instance_type = var.instance_type

  tags = { name : "MyTerraSv" }
}