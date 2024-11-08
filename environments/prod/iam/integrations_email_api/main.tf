module "taras_iam" {
  source = "../../../../modules/taras/iam"

  username    = var.username
  system_path = var.system_path

  policy = {
    "ses" = {
      name    = "ses-access",
      content = file("ses-policy.json")
    }
    "sqs" = {
      name    = "sqs-access",
      content = file("sqs-policy.json")
    }
     "sns" = {
      name    = "sns-access",
      content = file("sns-policy.json")
    }
    "s3" = {
      name    = "s3-access",
      content = file("s3-policy.json")
    }
  }
}
