variable "region" {
  description = "Which region envirment will be created"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile name on local machine for multi aws account use"
  default     = "taras"
}

variable "vpc_id" {
  default = "vpc-123"
}

variable "environment" {
  description = "Environment name"
  default     = "PROD"
}

variable "application" {
  description = "Name of application"
  default     = "Main"
}

variable "codedeploy_app_name" {
  default = "inncenter.nextgen"
}

variable "ami_id" {
  description = "AMI ID for Windows 2016 Server"
  default     = "ami-02fd1e6fb007ccf16"
}

variable "instance_type" {
  default = "c5.xlarge"
}

# SG for ALB/ELB
variable "security_group_ids_alb" {
  type    = list(string)
  default = ["sg-1"]
}

# SG for ec2 instances
variable "security_group_ids_ec2" {
  type    = list(string)
  default = ["sg-2", "sg-2"]
}

# Private subnet to use on private resources
variable "private_subnet_ids" {
  type    = list(string)
  default = ["subnet-1", "subnet-2", "subnet-3"]
}

# Public subnet need to use only in ALB/ELB if we need internat facing domain
variable "public_subnet_ids" {
  type        = list(string)
  description = "List of public subnets"
  default     = ["subnet-1", "subnet-2", "subnet-3"]
}

variable "tag_terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

variable "key_name" {
  description = "Pem key for EC2 Instance"
  default     = "windows-admin"
}

variable "health_check" {
  description = "Type of Health Check"
  default     = "EC2"
}

variable "route53_zone_id" {
  description = "Hosted Zone ID"
  default     = "here_zone_name"
}

variable "main_domain" {
  description = "Main domain name"
  default     = "steblynskyi.com"
}

variable "sub_domain" {
  description = "Subdomain for application"
  default     = "app"
}

variable "iam_role_codedeploy" {
  default = "arn:aws:iam::123:role/CodeDeploy_Service"
}

variable "OU" {
  default = "PROD Environment"
}

variable "cert_arn" {
  default = "arn:aws:acm:us-east-1:123:certificate/a21e50c9-56fd-438d-ba15-7e84db019a25"
}

variable "metrics" {
  description = "Auto Scaling Metrics"
  type        = list(string)
  default = [
    "GroupDesiredCapacity",
    "GroupInServiceCapacity",
    "GroupPendingCapacity",
    "GroupMinSize",
    "GroupMaxSize",
    "GroupInServiceInstances",
    "GroupPendingInstances",
    "GroupStandbyInstances",
    "GroupStandbyCapacity",
    "GroupTerminatingCapacity",
    "GroupTerminatingInstances",
    "GroupTotalCapacity",
    "GroupTotalInstances"
  ]
}

// ASG id of kubernetes node
variable "kube_node_asg_name" {
  default = "nodes-kube.steblynskyi.com"
}

variable "inventory_api" {
  default = "Inventory-Api"
}

variable "inventory_api_port" {
  default = 31047
}

variable "rates_ui" {
  default = "Rates-UI"
}

variable "rates_ui_port" {
  default = 30573
}

variable "guestServices_ui" {
  default = "GuestServices-UI"
}

variable "guestServices_ui_port" {
  default = 30884
}

variable "admin_ui" {
  default = "Admin-UI"
}

variable "admin_ui_port" {
  default = 30205
}

variable "setup_web" {
  default = "Setup-Web"
}

variable "setup_web_port" {
  default = 32415
}

variable "payment_reports_web" {
  default = "Payments-Reports-Web"
}

variable "payment_reports_web_port" {
  default = 30599
}

variable "reports_api" {
  default = "Reports-API"
}

variable "reports_api_port" {
  default = 32706
}

variable "reports_ui" {
  default = "Reports-UI"
}

variable "reports_ui_port" {
  default = 32114
}

variable "folio_api" {
  default = "Folio-API"
}

variable "folio_api_port" {
  default = 32402
}

variable "taxes_ui" {
  default = "Taxes-UI"
}

variable "taxes_ui_port" {
  default = 31220
}

variable "innsights_web_api" {
  default = "Innsights-Web-API"
}

variable "innsights_web_api_port" {
  default = 30464
}

variable "reservations_ui" {
  default = "Reservations-UI"
}

variable "reservations_ui_port" {
  default = 32464
}

variable "reservations_blocks_ui" {
  default = "Reservations-Blocks-UI"
}

variable "reservations_blocks_ui_port" {
  default = 32541
}

variable "reservations_api" {
  default = "Reservations-API"
}

variable "reservations_api_port" {
  default = 31125
}

variable "quickbooks_web" {
  default = "Quickbooks-WEB"
}

variable "quickbooks_web_port" {
  default = 31840
}

variable "reservations_acf_ui" {
  default = "Reservations-ACF-UI"
}

variable "reservations_acf_ui_port" {
  default = 31742
}

variable "reservations_acf_api" {
  default = "Reservations-ACF-API"
}

variable "reservations_acf_api_port" {
  default = 30911
}

variable "messaging_ui" {
  default = "Messaging-UI"
}

variable "messaging_ui_port" {
  default = 32348
}

variable "messaging_api" {
  default = "Messaging-API"
}

variable "messaging_api_port" {
  default = 30903
}

variable "identity_web" {
  default = "Identity-WEB"
}

variable "identity_web_port" {
  default = 31789
}

variable "unit_owners_ui" {
  default = "Unit-Owners-UI"
}

variable "unit_owners_ui_port" {
  default = 30922
}

variable "unit_owners_api" {
  default = "Unit-Owners-API"
}

variable "unit_owners_api_port" {
  default = 32281
}

variable "google_booking_links_ui" {
  default = "Google-Booking-Links-UI"
}

variable "google_booking_links_ui_port" {
  default = 31570
}

variable "custom_fields_ui" {
  default = "Custom-Fields-UI"
}

variable "custom_fields_ui_port" {
  default = 32207
}

variable "inncenter_web" {
  default = "Inncenter-Web"
}

variable "inncenter_web_port" {
  default = 32375
}

variable "setup_lightspeed_web" {
  default = "Setup-LightSpeed-Web"
}

variable "setup_lightspeed_web_port" {
  default = 32396
}

variable "accounts_ui" {
  default = "Accounts-UI"
}

variable "accounts_ui_port" {
  default = 30971
}

variable "extensions_remote_lock_web" {
  default = "Extensions-Remote-Lock-Web"
}

variable "extensions_remote_lock_web_port" {
  default = 32310
}

variable "integrations_email_web" {
  default = "Integrations-Email-WEB"
}

variable "integrations_email_web_port" {
  default = 32231
}

variable "extensions_templates_web" {
  default = "Extensions-Templates-Web"
}

variable "extensions_templates_web_port" {
  default = 30592
}