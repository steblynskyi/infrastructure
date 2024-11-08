# IAM User configuration
module "taras_iam" {
  source      = "../../../../modules/taras/iam"
  username    = var.username
  system_path = var.system_path

  policy = {
    "jenkins-slave" = {
      name    = "jenkins-slave",
      content = file("jenkins-slave.json")
    }
  }
}