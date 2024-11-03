module "taras_iam" {
  source = "../../../modules/taras/iam"

  username    = var.username
  system_path = var.system_path

  policy = {
    "dynamodb" = {
      name    = "dynamodb-access",
      content = file("dynamodb-policy.json")
    },
    "s3" = {
      name    = "s3-access",
      content = file("s3-policy.json")
    }
  }
}