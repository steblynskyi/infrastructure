# Config terraform backand s3 to save state file
terraform {

  required_version = ">= 1.1.5"

  backend "s3" {
    bucket  = "steblynskyi-infra"
    key     = "terraform/qa/kafka/kafka-proxy.tfstate"
    region  = "us-east-1"
    profile = "taras"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.18.1"
    }
  }
}