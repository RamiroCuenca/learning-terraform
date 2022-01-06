# Standard is that main.tf is the name of the file if it's a single file or if it's the entry point file.

# 1. terraform init

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

locals {
  # similar to input variables but hardcoded in the code
  instance_ami = "0ed9277fb7eb570c9" # Check the region because it's different in each region!
}

output "instance_ip_addr" {
  value = aws_instance.my_server.public_ip
}

resource "aws_instance" "my_server" {
  ami           = "ami-${local.instance_ami}"
  instance_type = var.instance_type

  tags = { name : "MyTerraSv" }
}