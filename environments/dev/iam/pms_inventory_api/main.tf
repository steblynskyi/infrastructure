module "taras_iam" {
  source = "../../../modules/taras/iam"

  username    = var.username
  system_path = var.system_path

  policy = {
    "s3-policy" = {
      name    = "s3-access",
      content = file("s3-policy.json")
    },
    "sns-policy" = {
      name    = "sns-access",
      content = file("sns-policy.json")
    },
    "sqs-policy" = {
      name    = "sqs-access",
      content = file("sqs-policy.json")
    }
  }
}