module "taras_iam" {
  source = "../../../modules/taras/iam"

  username    = var.username
  system_path = var.system_path

  managed_policy = {
    "rds" = {
      name    = "devops-portal-rds-access",
      content = file("devops-portal-rds-access.json")
    },
    "s3" = {
      name    = "devops-portal-s3-access",
      content = file("devops-portal-s3-access.json")
    },
    "iam" = {
      name    = "devops-portal-iam-access",
      content = file("devops-portal-iam-access.json")
    }
    "ses" = {
      name    = "devops-portal-ses-access",
      content = file("devops-portal-ses-access.json")
    }
  }
}
