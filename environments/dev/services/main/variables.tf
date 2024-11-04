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
  default     = "DEV"
}

// ASG id of kubernetes node
variable "kube_node_asg_name" {
  default = "nodes-kube.dev-steblynskyi.com"
}

variable "application" {
  description = "Name of application"
  default     = "main"
}

variable "codedeploy_app_name" {
  default = "main"
}

variable "ami_id" {
  description = "AMI ID for Windows 2016 Server"
  default     = "ami-0a043fe42b4e19c43"
}

variable "instance_type" {
  default = "t3.large"
}

# SG for ALB/ELB
variable "security_group_ids_alb" {
  type    = list(string)
  default = ["sg-1"]
}

# SG for ec2 instances
variable "security_group_ids_ec2" {
  type    = list(string)
  default = ["sg-1", "sg-2"]
}

# Private subnet to use on private resources
variable "private_subnet_ids" {
  type    = list(string)
  default = ["subnet-1", "subnet-2"]
}

variable "tag_terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

# Public subnet need to use only in ALB/ELB if we need internat facing domain
variable "public_subnets" {
  type        = list(string)
  description = "List of public subnets"
  default     = ["subnet-1", "subnet-2"]
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
  default     = "Z1NMDDDDDD6A15"
}

variable "main_domain" {
  description = "Main domain name"
  default     = "dev-steblynskyi.com"
}

variable "sub_domain" {
  description = "Subdomain for application"
  default     = "app"
}

variable "iam_role_codedeploy" {
  default = "arn:aws:iam::123:role/CodeDeploy_Service"
}

variable "OU" {
  default = "DEV Environment"
}

variable "cert_arn" {
  default = "arn:aws:acm:us-east-1:123:certificate/111-22-33-44-55"
}

variable "inventory_api" {
  default = "Inventory-Api"
}

variable "inventory_api_port" {
  default = 32096
}

variable "rates_ui" {
  default = "Rates-UI"
}

variable "rates_ui_port" {
  default = 30244
}

variable "guestServices_ui" {
  default = "GuestServices-UI"
}

variable "guestServices_ui_port" {
  default = 32133
}

variable "admin_ui" {
  default = "Admin-UI"
}

variable "admin_ui_port" {
  default = 32491
}

variable "setup_web" {
  default = "Setup-Web"
}

variable "setup_web_port" {
  default = 31908
}

variable "payment_reports_web" {
  default = "Payments-Reports-Web"
}

variable "payment_reports_web_port" {
  default = 32472
}

variable "reports_api" {
  default = "Reports-API"
}

variable "reports_api_port" {
  default = 31282
}

variable "reports_ui" {
  default = "Reports-UI"
}

variable "reports_ui_port" {
  default = 31900
}

variable "folio_api" {
  default = "Folio-API"
}

variable "folio_api_port" {
  default = 31999
}

variable "taxes_ui" {
  default = "Taxes-UI"
}

variable "taxes_ui_port" {
  default = 31789
}

variable "innsights_web_api" {
  default = "Innsights-Web-API"
}

variable "innsights_web_api_port" {
  default = 32197
}

variable "reservations_ui" {
  default = "Reservations-UI"
}

variable "reservations_ui_port" {
  default = 31146
}

variable "reservations_blocks_ui" {
  default = "Reservations-Blocks-UI"
}

variable "reservations_blocks_ui_port" {
  default = 31322
}

variable "reservations_api" {
  default = "Reservations-API"
}

variable "reservations_api_port" {
  default = 32358
}

variable "quickbooks_web" {
  default = "Quickbooks-WEB"
}

variable "quickbooks_web_port" {
  default = 30834
}

variable "messaging_ui" {
  default = "Messaging-UI"
}

variable "messaging_ui_port" {
  default = 30416
}

variable "unit_owners_api" {
  default = "Unit-Owners-API"
}

variable "unit_owners_api_port" {
  default = 30542
}

variable "identity_web" {
  default = "Identity-WEB"
}

variable "identity_web_port" {
  default = 30104
}

variable "messaging_api" {
  default = "Messaging-API"
}

variable "messaging_api_port" {
  default = 30421
}

variable "setup_google_booking_links" {
  default = "Setup-Google-Booking-Web"
}

variable "setup_google_booking_links_port" {
  default = 32216
}

variable "setup_lightspeed" {
  default = "Setup-LightSpeed-Web"
}

variable "setup_lightspeed_port" {
  default = 31886
}

variable "center_web" {
  default = "center-Web"
}

variable "center_web_port" {
  default = 31435
}

variable "setup_merchant_services" {
  default = "Setup-Merchant-Services"
}

variable "setup_merchant_services_port" {
  default = 31435
}

variable "setup_fields_configuration" {
  default = "Setup-Fields-Configuration"
}

variable "setup_fields_configuration_port" {
  default = 30544
}

variable "extensions_remote_lock_web" {
  default = "Extensions-Remote-Lock-Web"
}

variable "extensions_remote_lock_web_port" {
  default = 30802
}

variable "admin_clients_ui" {
  default = "Admin-Clients-UI"
}

variable "admin_clients_ui_port" {
  default = 31435
}

variable "reports_api_beta" {
  default = "Reports-API-Beta"
}

variable "reports_api_beta_port" {
  default = 32501
}

variable "reports_ui_beta" {
  default = "Reports-UI-Beta"
}

variable "reports_ui_beta_port" {
  default = 32140
}

variable "reservations_csp_ui" {
  default = "Reservations-CSP-UI"
}

variable "reservations_csp_ui_port" {
  default = 30740
}

variable "accounts_ui" {
  default = "Accounts-UI"
}

variable "accounts_ui_port" {
  default = 30216
}

variable "integrations_email_web" {
  default = "Integrations-Email-WEB"
}

variable "integrations_email_web_port" {
  default = 32370
}

variable "extensions_templates_web" {
  default = "Extensions-Templates-Web"
}

variable "extensions_templates_web_port" {
  default = 31076
}