# Config terraform backand s3 to save state file
terraform {
  backend "s3" {
    bucket  = "steblynskyi-prod-infrastructure"
    key     = "terraform/prod/system_manager/parameters/identity-api.tfstate"
    region  = "us-east-1"
    profile = "taras"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.1.5"
}

# Cloud provider configuration
provider "aws" {
  region  = var.region
  profile = var.aws_profile
}

resource "aws_ssm_parameter" "key_a" {
  name        = "/Production/steblynskyi.Identity.Api/DataProtection/key-d17a8fd7-ded3-4691-a1a9-104028a436ee"
  description = var.description-a
  type        = "SecureString"
  key_id      = "arn:aws:kms:us-east-1:123:key/41d19588-b209-4459-a9ec-085adaace12b"
  value       = file("key-a.xml")

  tags = {
    "Environment" : var.environment
    "Terraform" : var.tag_terraform
  }
}

resource "aws_ssm_parameter" "key_b" {
  name        = "/Production/steblynskyi.Identity.Api/DataProtection/key-b8940e12-b21c-4af2-ba08-3aef40204071"
  description = var.description-b
  type        = "SecureString"
  key_id      = "arn:aws:kms:us-east-1:123:key/41d19588-b209-4459-a9ec-085adaace12b"
  value       = file("key-b.xml")

  tags = {
    "Environment" : var.environment
    "Terraform" : var.tag_terraform
  }
}