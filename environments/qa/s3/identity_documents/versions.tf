# Config terraform backand s3 to save state file
terraform {

  required_version = ">= 1.1.5"

  backend "s3" {
    bucket  = "steblynskyi-infra"
    key     = "terraform/qa/s3/identity_documents.tfstate"
    region  = "us-east-1"
    profile = "taras"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Cloud provider configuration
provider "aws" {
  region  = var.region
  profile = var.aws_profile
}