# IAM User
resource "aws_iam_user" "this" {
  name          = var.username
  path          = var.system_path
  force_destroy = var.force_destroy
}

# Access Key
resource "aws_iam_access_key" "this" {
  user = aws_iam_user.this.name
}

# User Policy
resource "aws_iam_user_policy" "this" {
  for_each = var.policy
  name     = each.value.name
  user     = aws_iam_user.this.name
  policy   = each.value.content
}

# Managed Policy
resource "aws_iam_policy" "this" {
  for_each = var.managed_policy
  name     = each.value.name
  policy   = each.value.content
}

# Attachment Policy
resource "aws_iam_user_policy_attachment" "this" {
  for_each   = aws_iam_policy.this
  policy_arn = each.value.arn
  user       = aws_iam_user.this.name
}
