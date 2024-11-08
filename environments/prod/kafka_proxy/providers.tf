provider "aws" {
  region  = local.aws_region
  profile = local.aws_profile
}

provider "kubernetes" {
  host           = var.kubernetes_host
  config_path    = "~/.kube/config"
  config_context = var.kubernetes_context
}