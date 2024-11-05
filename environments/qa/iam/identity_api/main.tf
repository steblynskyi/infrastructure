module "taras_iam" {
  source = "../../../../modules/taras/iam"

  username    = var.username
  system_path = var.system_path

  policy = {
    "identity-secret" = {
      name    = "identity-secret-access",
      content = file("identity-secret-access-policy.json")
    },
    "identity-ssm" = {
      name    = "identity-ssm-access",
      content = file("identity-ssm-access-policy.json")
    }
  }
}