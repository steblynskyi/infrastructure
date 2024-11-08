module "taras_iam" {
  source      = "../../../../modules/taras/iam"
  username    = var.username
  system_path = var.system_path

  policy = {
    "sns" = {
      name    = "sns-access",
      content = file("sns-policy.json")
    }

    "ses" = {
      name    = "ses-access",
      content = file("ses-policy.json")
    }
  }
}