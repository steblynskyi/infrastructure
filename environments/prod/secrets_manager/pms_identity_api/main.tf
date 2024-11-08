resource "aws_secretsmanager_secret" "this" {
  name = var.secret_name

  tags = {
    "Environment" : var.environment
    "Terraform" : var.tag_terraform
  }
}

resource "aws_secretsmanager_secret_version" "this" {
  secret_id     = aws_secretsmanager_secret.this.id
  secret_binary = filebase64("currentRS256.txt")
}