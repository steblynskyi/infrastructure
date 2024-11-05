# IAM User configuration
module "taras_iam" {
  source = "../../../../modules/taras/iam"

  username    = var.username
  system_path = var.system_path

  managed_policy = {
    "kube-alb-ingress-controller" = {
      name    = "kube-alb-ingress-controller-qa",
      content = file("kube-alb-ingress-controller.json")
    },
    "s3" = {
      name    = "s3-access-qa",
      content = file("s3-access.json")
    }
  }
}
