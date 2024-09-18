terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }

  # cloud {
  #   organization = "sai-tfc-org"
  #   hostname = "app.terraform.io" # Required for Terraform Enterprise; Defaults to app.terraform.io for HCP Terraform

  #   workspaces {
  #     name = "hellocloud-keypair-ws"
  #   }
  # }
}

provider "aws" {
  region  = var.aws_region
  profile = "default"
}