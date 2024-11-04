terraform {
  backend "s3" {
    bucket = "ir-dev.us-standard.int.kube"
    key    = "terraform/us-access/vault.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.1.5"
}

# aws provider
provider "aws" {
  region  = var.region
  profile = var.aws_profile
}

# aws caller account data


#kubectl create secret generic aws-kms-key-id \
#--from-literal=KMS_KEY_ID=<your_key_id>

# Create KMS key
resource "aws_kms_key" "vault-key" {
  description             = "KMS Key to use for Vault"
  deletion_window_in_days = 14
  policy                  = <<EOF
  {
    "Version": "2012-10-17",
    "Id": "key-default-1",
    "Statement": [
        {
            "Sid": "Enable IAM User Permissions",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::123:root"
            },
            "Action": "kms:*",
            "Resource": "*"
        },
        {
            "Sid": "Allow use of the key",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::123:user/vault-user-us-access"
            },
            "Action": [
                "kms:*"
            ],
            "Resource": "arn:aws:kms:us-east-1:123:key/*"
        }
    ]
}
EOF
}

# KMS alias
resource "aws_kms_alias" "vault-key_alias" {
  name          = "alias/vault-us-access"
  target_key_id = aws_kms_key.vault-key.id
}

#kubectl create secret generic aws-secret-access-key \
#--from-literal=AWS_ACCESS_KEY_ID=<your_aws_access_key> \
#--from-literal=AWS_SECRET_ACCESS_KEY=<your_aws_access_key_secret>
resource "aws_iam_user" "vault-user-us-access" {
  name = "vault-user-us-access"

  depends_on = [
    aws_kms_key.vault-key
  ]
}

# Access key
resource "aws_iam_access_key" "access_key" {
  user    = aws_iam_user.vault-user-us-access.name
  pgp_key = var.pgp_key
}

resource "aws_iam_user_policy" "root" {
  name   = "root"
  user   = aws_iam_user.vault-user-us-access.name
  policy = data.aws_iam_policy_document.vault-kms-policy.json
}

data "aws_iam_policy_document" "vault-kms-policy" {
  statement {
    sid = "vaultKmsPolicy1"
    actions = [
      "kms:*"
    ]
    resources = [
      "${aws_kms_key.vault-key.arn}"
    ]
    effect = "Allow"
  }
}


output "access_key_status" {
  description = "Active or Inactive. Keys are initially active, but can be made inactive by other means."
  value       = aws_iam_access_key.access_key.status
}

output "access_key_id" {
  description = "The access key ID"
  value       = aws_iam_access_key.access_key.id
  sensitive   = true
}

output "secret_access_key" {
  description = "The secret access key converted into an SES SMTP password"
  value       = aws_iam_access_key.access_key.secret
  sensitive   = true
}

output "user_arn" {
  description = "The ARN assigned by AWS for this user"
  value       = aws_iam_user.vault-user-us-access.arn
}

output "kms_key_id" {
  value = aws_kms_key.vault-key.id
}

output "kms_key_arn" {
  value = aws_kms_key.vault-key.arn
}
