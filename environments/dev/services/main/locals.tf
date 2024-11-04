locals {
  app_env    = "${var.application}-${var.environment}"
  app_domain = "${var.sub_domain}.${var.main_domain}"
  lc_suffix  = "${var.application}-${var.environment}-${random_string.lc_cfg_suffix.result}"

  inventory_api      = "${var.inventory_api}-${var.environment}"
  inventory_api_port = var.inventory_api_port

  rates_ui      = "${var.rates_ui}-${var.environment}"
  rates_ui_port = var.rates_ui_port

  setup_web      = "${var.setup_web}-${var.environment}"
  setup_web_port = var.setup_web_port

  guestServices_ui      = "${var.guestServices_ui}-${var.environment}"
  guestServices_ui_port = var.guestServices_ui_port

  admin_ui      = "${var.admin_ui}-${var.environment}"
  admin_ui_port = var.admin_ui_port

  payment_reports_web      = "${var.payment_reports_web}-${var.environment}"
  payment_reports_web_port = var.payment_reports_web_port

  reports_api      = "${var.reports_api}-${var.environment}"
  reports_api_port = var.reports_api_port

  reports_ui      = "${var.reports_ui}-${var.environment}"
  reports_ui_port = var.reports_ui_port

  folio_api      = "${var.folio_api}-${var.environment}"
  folio_api_port = var.folio_api_port

  taxes_ui      = "${var.taxes_ui}-${var.environment}"
  taxes_ui_port = var.taxes_ui_port

  innsights_web_api      = "${var.innsights_web_api}-${var.environment}"
  innsights_web_api_port = var.innsights_web_api_port

  reservations_ui      = "${var.reservations_ui}-${var.environment}"
  reservations_ui_port = var.reservations_ui_port

  reservations_blocks_ui      = "${var.reservations_blocks_ui}-${var.environment}"
  reservations_blocks_ui_port = var.reservations_blocks_ui_port

  reservations_api      = "${var.reservations_api}-${var.environment}"
  reservations_api_port = var.reservations_api_port

  quickbooks_web      = "${var.quickbooks_web}-${var.environment}"
  quickbooks_web_port = var.quickbooks_web_port

  messaging_ui      = "${var.messaging_ui}-${var.environment}"
  messaging_ui_port = var.messaging_ui_port

  unit_owners_api      = "${var.unit_owners_api}-${var.environment}"
  unit_owners_api_port = var.unit_owners_api_port

  identity_web      = "${var.identity_web}-${var.environment}"
  identity_web_port = var.identity_web_port

  messaging_api      = "${var.messaging_api}-${var.environment}"
  messaging_api_port = var.messaging_api_port

  setup_google_booking_links      = "${var.setup_google_booking_links}-${var.environment}"
  setup_google_booking_links_port = var.setup_google_booking_links_port

  setup_lightspeed      = "${var.setup_lightspeed}-${var.environment}"
  setup_lightspeed_port = var.setup_lightspeed_port

  center_web      = "${var.center_web}-${var.environment}"
  center_web_port = var.center_web_port

  setup_merchant_services      = "${var.setup_merchant_services}-${var.environment}"
  setup_merchant_services_port = var.setup_merchant_services_port

  setup_fields_configuration      = "${var.setup_fields_configuration}-${var.environment}"
  setup_fields_configuration_port = var.setup_fields_configuration_port

  extensions_remote_lock_web      = "${var.extensions_remote_lock_web}-${var.environment}"
  extensions_remote_lock_web_port = var.extensions_remote_lock_web_port

  admin_clients_ui      = "${var.admin_clients_ui}-${var.environment}"
  admin_clients_ui_port = var.admin_clients_ui_port

  reports_api_beta      = "${var.reports_api_beta}-${var.environment}"
  reports_api_beta_port = var.reports_api_beta_port

  reports_ui_beta      = "${var.reports_ui_beta}-${var.environment}"
  reports_ui_beta_port = var.reports_ui_beta_port

  reservations_csp_ui      = "${var.reservations_csp_ui}-${var.environment}"
  reservations_csp_ui_port = var.reservations_csp_ui_port

  accounts_ui      = "${var.accounts_ui}-${var.environment}"
  accounts_ui_port = var.accounts_ui_port

  integrations_email_web      = "${var.integrations_email_web}-${var.environment}"
  integrations_email_web_port = var.integrations_email_web_port

  extensions_templates_web      = "${var.extensions_templates_web}-${var.environment}"
  extensions_templates_web_port = var.extensions_templates_web_port
}