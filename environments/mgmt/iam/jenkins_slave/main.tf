# IAM User configuration
module "taras_iam" {
  source = "../../../../modules/taras/iam"

  username    = var.username
  system_path = var.system_path

  policy = {
    "ec2" = {
      name    = "ec2",
      content = file("ec2-policy.json")
    },
    "s3" = {
      name    = "s3-access-mgmt",
      content = file("s3-policy.json")
    },
    "codedeploy" = {
      name    = "codedeploy",
      content = file("codedeploy-policy.json")
    }
  }
}