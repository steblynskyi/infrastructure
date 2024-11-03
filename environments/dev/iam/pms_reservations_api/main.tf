module "taras_iam" {
  source = "../../../modules/taras/iam"

  username    = var.username
  system_path = var.system_path

  policy = {
    "s3" = {
      name    = "s3-access",
      content = file("s3-policy.json")
    },
    "sqs" = {
      name    = "sqs-access",
      content = file("sqs-policy.json")
    },
    "ses" = {
      name    = "ses-access",
      content = file("ses-policy.json")
    }
  }

  managed_policy = {
    "sns" = {
      name    = "sns-access",
      content = file("sns-policy.json")
    }
  }
}