module "taras_iam" {
  source = "../../../../modules/taras/iam"

  username    = var.username
  system_path = var.system_path

  policy = {
    "sqs" = {
      name    = "sqs-access",
      content = file("sqs-policy.json")
    }
  }

  managed_policy = {
    "sns" = {
      name    = "sns-access",
      content = file("sns-policy.json")
    }
  }
}