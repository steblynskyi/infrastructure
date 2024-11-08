module "taras_iam" {
  source = "../../../../modules/taras/iam"

  username    = var.username
  system_path = var.system_path

  policy = {
    "secret-manager" = {
      name    = "secret-manager-access",
      content = file("secret-manager-policy.json")
    },
    "ssm" = {
      name    = "ssm-access",
      content = file("ssm-policy.json")
    }
  }
}