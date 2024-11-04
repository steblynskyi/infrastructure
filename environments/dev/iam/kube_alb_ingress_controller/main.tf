# IAM User configuration
module "taras_iam" {
  source = "../../../../modules/taras/iam"

  username    = var.username
  system_path = var.system_path

  managed_policy = {
    "kube-alb-ingress-controller" = {
      name    = "kube-alb-ingress-controller-dev",
      content = file("kube-alb-ingress-controller.json")
    },
    "s3" = {
      name    = "s3-access-dev",
      content = file("s3-access.json")
    }
  }
}
