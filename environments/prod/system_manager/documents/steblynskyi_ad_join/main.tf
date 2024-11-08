# SSN Doc to assign instance to DC
resource "aws_ssm_document" "steblynskyi_ad_join" {
  name          = "steblynskyi-ad-join"
  document_type = "Command"

  content = <<DOC
{
  "schemaVersion": "1.2",
  "description": "Join your instances to an AWS Directory Service domain.",
  "parameters": {
    "directoryId": {
      "type": "String",
      "description": "(Required) The ID of the AWS Directory Service directory."
    },
    "directoryName": {
      "type": "String",
      "description": "(Required) The name of the directory; for example, test.example.com"
    },
    "directoryOU": {
      "type": "String",
      "default": "",
      "description": "(Optional) The Organizational Unit (OU) and Directory Components (DC) for the directory; for example, OU=test,DC=example,DC=com"
    }
  },
  "runtimeConfig": {
    "aws:runPowerShellScript": {
      "properties": {
        "runCommand": [
          "Rename-Computer -NewName (invoke-restmethod -uri http://169.254.169.254/latest/meta-data/instance-id) -Force"
        ],
        "timeoutSeconds": [
          "30"
        ]
      }
    },
    "aws:domainJoin": {
      "properties": {
        "directoryId": "{{ directoryId }}",
        "directoryName": "{{ directoryName }}",
        "directoryOU": "{{ directoryOU }}",
        "dnsIpAddresses": [
            "10.50.1.194",
            "10.50.2.23"
        ]
      }
    }
  }
}
DOC

  tags = {
    Environment = var.environment
    Terraform   = var.tag_terraform
  }
}