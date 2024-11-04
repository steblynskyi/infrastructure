terraform {

  required_version = ">= 1.1.5"

  backend "s3" {
    bucket  = "steblynskyi-infra"
    key     = "terraform/mgmt/eks/vault_eks.tfstate"
    region  = "us-east-1"
    profile = "taras"
  }

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.7"
    }

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14"
    }
  }
}