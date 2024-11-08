# Config terraform backand s3 to save state file
terraform {

  required_version = ">= 1.1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
