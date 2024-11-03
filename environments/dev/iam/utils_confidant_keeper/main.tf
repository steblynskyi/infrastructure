module "taras_iam" {
  source = "../../../modules/taras/iam"

  username    = var.username
  system_path = var.system_path

  policy = {
    "dynamodb" = {
      name    = "dynamodb-kms-iam-access",
      content = file("dynamodb-kms-iam-policy.json")
    }
  }
}