# SNS Topic Task-New-Created
resource "aws_sns_topic" "Pms-Task-New-Created" {
  name         = "Pms-Task-New-Created-PROD"
  display_name = "Pms-Task-New-Created-PROD"
}

# SNS Topic Task-Assigned
resource "aws_sns_topic" "Pms-Task-Assigned" {
  name         = "Pms-Task-Assigned-PROD"
  display_name = "Pms-Task-Assigned-PROD"
}

# SNS Topic Task-Deleted
resource "aws_sns_topic" "Pms-Task-Deleted" {
  name         = "Pms-Task-Deleted-PROD"
  display_name = "Pms-Task-Deleted-PROD"
}

# SNS Topic Task-Details-Updated
resource "aws_sns_topic" "Pms-Task-Details-Updated" {
  name         = "Pms-Task-Details-Updated-PROD"
  display_name = "Pms-Task-Details-Updated-PROD"
}

# SNS Topic Task-Status-Updated
resource "aws_sns_topic" "Pms-Task-Status-Updated" {
  name         = "Pms-Task-Status-Updated-PROD"
  display_name = "Pms-Task-Status-Updated-PROD"
}

# SNS Topic Task-Unassigned
resource "aws_sns_topic" "Pms-Task-Unassigned" {
  name         = "Pms-Task-Unassigned-PROD"
  display_name = "Pms-Task-Unassigned-PROD"
}

# SNS Topic Email-Innsights
resource "aws_sns_topic" "Email-Innsights" {
  name         = "Email-Innsights-PROD"
  display_name = "Email-Innsights-PROD"
}

resource "aws_sns_topic_subscription" "Email-Innsights" {
  topic_arn                       = aws_sns_topic.Email-Innsights.arn
  protocol                        = "https"
  endpoint_auto_confirms          = "true"
  confirmation_timeout_in_minutes = "5"
  endpoint                        = "https://app.steblynskyi.com/innsights/api/sns/RaiseEmailEvent"
}

# SNS Topic Task-Importrole-Handler
resource "aws_sns_topic" "Pms-Task-Importrole-Handler" {
  name         = "Pms-Task-Importrole-Handler-PROD"
  display_name = "Pms-Task-Importrole-Handler-PROD"
}

# SNS Topic Email-API
resource "aws_sns_topic" "Email-API" {
  name         = "Email-API-PROD"
  display_name = "Email-API-PROD"
}

resource "aws_sns_topic_subscription" "Email-API" {
  topic_arn                       = aws_sns_topic.Email-API.arn
  protocol                        = "https"
  endpoint_auto_confirms          = "true"
  confirmation_timeout_in_minutes = "5"
  endpoint                        = "https://pms-email-api.steblynskyi.com/api/AwsSesNotifications/notify"
}

# SNS Topic Integrations-Email-API-SesDeliveryNotifications
resource "aws_sns_topic" "Integrations-Email-API-SesDeliveryNotifications" {
  name         = "Integrations-Email-API-SesDeliveryNotifications-PROD"
  display_name = "Integrations-Email-API-SesDeliveryNotifications-PROD"
}

resource "aws_sns_topic_subscription" "Integrations-Email-API-SesDeliveryNotifications" {
  topic_arn = "arn:aws:sns:us-east-1:123:Integrations-Email-API-SesDeliveryNotifications-PROD"
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Integrations-Email-API-SesDeliveryNotifications-PROD"
}

# SNS Topic WebHooks-ReservationCreated
resource "aws_sns_topic" "WebHooks-ReservationCreated" {
  name         = "WebHooks-ReservationCreated-PROD"
  display_name = "WebHooks-ReservationCreated-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationCreated-InnSights-WebHookQueue" {
  topic_arn = aws_sns_topic.WebHooks-ReservationCreated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:InnSights-WebHookQueue-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationCreated-Task-Reservation-Updated" {
  topic_arn = aws_sns_topic.WebHooks-ReservationCreated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Reservation-Updated-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationCreated-WebHooks-FolioQueue" {
  topic_arn = aws_sns_topic.WebHooks-ReservationCreated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-FolioQueue-PROD"
  filter_policy = <<POLICY
                  {
                    "publisherid": [{"anything-but": "steblynskyi.reservations.api"}]
                  }
                  POLICY
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationCreated-WebHooks-MessagingQueue" {
  topic_arn = aws_sns_topic.WebHooks-ReservationCreated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-MessagingQueue-PROD"
  filter_policy = <<POLICY
                  {
                    "publisherid": [{"anything-but": "steblynskyi.Reservations.Api"},
                                    {"anything-but": "CRSAdapter"},
                                    {"anything-but": "steblynskyi.Api.Core"}]
                  }
                  POLICY
}

# SNS Topic WebHooks-ReservationUpdated
resource "aws_sns_topic" "WebHooks-ReservationUpdated" {
  name         = "WebHooks-ReservationUpdated-PROD"
  display_name = "WebHooks-ReservationUpdated-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationUpdated-InnSights-WebHookQueue" {
  topic_arn = aws_sns_topic.WebHooks-ReservationUpdated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:InnSights-WebHookQueue-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationUpdated-Task-Reservation-Updated" {
  topic_arn = aws_sns_topic.WebHooks-ReservationUpdated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Reservation-Updated-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationUpdated-WebHooks-FolioQueue" {
  topic_arn = aws_sns_topic.WebHooks-ReservationUpdated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-FolioQueue-PROD"
  filter_policy = <<POLICY
                  {
                    "publisherid": [{"anything-but": "steblynskyi.reservations.api"}]
                  }
                  POLICY
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationUpdated-WebHooks-MessagingQueue" {
  topic_arn = aws_sns_topic.WebHooks-ReservationUpdated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-MessagingQueue-PROD"
  filter_policy = <<POLICY
                  {
                    "publisherid": [{"anything-but": "steblynskyi.Reservations.Api"},
                                    {"anything-but": "CRSAdapter"},
                                    {"anything-but": "steblynskyi.Api.Core"}]
                  }
                  POLICY
}

# SNS Topic WebHooks-GroupBlockCreate
resource "aws_sns_topic" "WebHooks-GroupBlockCreate" {
  name         = "WebHooks-GroupBlockCreate-PROD"
  display_name = "WebHooks-GroupBlockCreate-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-GroupBlockCreate" {
  topic_arn = aws_sns_topic.WebHooks-GroupBlockCreate.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:InnSights-WebHookQueue-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-GroupBlockCreate-WebHooks-FolioQueue" {
  topic_arn = aws_sns_topic.WebHooks-GroupBlockCreate.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-FolioQueue-PROD"
}

# SNS Topic WebHooks-GroupBlockUpdate
resource "aws_sns_topic" "WebHooks-GroupBlockUpdate" {
  name         = "WebHooks-GroupBlockUpdate-PROD"
  display_name = "WebHooks-GroupBlockUpdate-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-GroupBlockUpdate" {
  topic_arn = aws_sns_topic.WebHooks-GroupBlockUpdate.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:InnSights-WebHookQueue-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-GroupBlockUpdate-WebHooks-FolioQueue" {
  topic_arn = aws_sns_topic.WebHooks-GroupBlockUpdate.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-FolioQueue-PROD"
}

# SNS Topic WebHooks-RoomMaintenanceCreate
resource "aws_sns_topic" "WebHooks-RoomMaintenanceCreate" {
  name         = "WebHooks-RoomMaintenanceCreate-PROD"
  display_name = "WebHooks-RoomMaintenanceCreate-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-RoomMaintenanceCreate" {
  topic_arn = aws_sns_topic.WebHooks-RoomMaintenanceCreate.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:InnSights-WebHookQueue-PROD"
}

# SNS Topic WebHooks-RoomMaintenanceUpdate
resource "aws_sns_topic" "WebHooks-RoomMaintenanceUpdate" {
  name         = "WebHooks-RoomMaintenanceUpdate-PROD"
  display_name = "WebHooks-RoomMaintenanceUpdate-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-RoomMaintenanceUpdate" {
  topic_arn = aws_sns_topic.WebHooks-RoomMaintenanceUpdate.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:InnSights-WebHookQueue-PROD"
}

# SNS Topic WebHooks ReservationCheckedIn
resource "aws_sns_topic" "WebHooks-ReservationCheckedIn" {
  name         = "WebHooks-ReservationCheckedIn-PROD"
  display_name = "WebHooks-ReservationCheckedIn-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationCheckedIn" {
  topic_arn = aws_sns_topic.WebHooks-ReservationCheckedIn.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Reservation-Updated-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationCheckedIn-WebHooks-FolioQueue" {
  topic_arn = aws_sns_topic.WebHooks-ReservationCheckedIn.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-FolioQueue-PROD"
  filter_policy = <<POLICY
                  {
                    "publisherid": [{"anything-but": "steblynskyi.reservations.api"}]
                  }
                  POLICY
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationCheckedIn-WebHooks-MessagingQueue" {
  topic_arn = aws_sns_topic.WebHooks-ReservationCheckedIn.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-MessagingQueue-PROD"
  filter_policy = <<POLICY
                  {
                    "publisherid": [{"anything-but": "steblynskyi.Reservations.Api"},
                                    {"anything-but": "CRSAdapter"},
                                    {"anything-but": "steblynskyi.Api.Core"}]
                  }
                  POLICY
}

# SNS Topic WebHooks ReservationCheckedOut
resource "aws_sns_topic" "WebHooks-ReservationCheckedOut" {
  name         = "WebHooks-ReservationCheckedOut-PROD"
  display_name = "WebHooks-ReservationCheckedOut-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationCheckedOut" {
  topic_arn = aws_sns_topic.WebHooks-ReservationCheckedOut.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Reservation-Updated-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationCheckedOut-WebHooks-FolioQueue" {
  topic_arn = aws_sns_topic.WebHooks-ReservationCheckedOut.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-FolioQueue-PROD"
  filter_policy = <<POLICY
                  {
                    "publisherid": [{"anything-but": "steblynskyi.reservations.api"}]
                  }
                  POLICY
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationCheckedOut-WebHooks-MessagingQueue" {
  topic_arn = aws_sns_topic.WebHooks-ReservationCheckedOut.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-MessagingQueue-PROD"
  filter_policy = <<POLICY
                  {
                    "publisherid": [{"anything-but": "steblynskyi.Reservations.Api"},
                                    {"anything-but": "CRSAdapter"},
                                    {"anything-but": "steblynskyi.Api.Core"}]
                  }
                  POLICY
}

# SNS Topic WebHooks ReservationParkingLotUpdated
resource "aws_sns_topic" "WebHooks-ReservationParkingLotUpdated" {
  name         = "WebHooks-ReservationParkingLotUpdated-PROD"
  display_name = "WebHooks-ReservationParkingLotUpdated-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationParkingLotUpdated" {
  topic_arn = aws_sns_topic.WebHooks-ReservationParkingLotUpdated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Reservation-Updated-PROD"
}

# SNS Topic WebHooks ReservationQuoteCreated
resource "aws_sns_topic" "WebHooks-ReservationQuoteCreated" {
  name         = "WebHooks-ReservationQuoteCreated-PROD"
  display_name = "WebHooks-ReservationQuoteCreated-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationQuoteCreated" {
  topic_arn = aws_sns_topic.WebHooks-ReservationQuoteCreated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Reservation-Updated-PROD"
}

# SNS Topic WebHooks WebHooks-FolioCreated
resource "aws_sns_topic" "WebHooks-FolioCreated" {
  name         = "WebHooks-FolioCreated-PROD"
  display_name = "WebHooks-FolioCreated-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-FolioCreated" {
  topic_arn = aws_sns_topic.WebHooks-FolioCreated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-FolioQueue-PROD"
}

# SNS Topic WebHooks WebHooks-FolioUpdated
resource "aws_sns_topic" "WebHooks-FolioUpdated" {
  name         = "WebHooks-FolioUpdated-PROD"
  display_name = "WebHooks-FolioUpdated-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-FolioUpdated" {
  topic_arn = aws_sns_topic.WebHooks-FolioUpdated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-FolioQueue-PROD"
}

# SNS Topic WebHooks WebHooks-GroupPickUp
resource "aws_sns_topic" "WebHooks-GroupPickUp" {
  name         = "WebHooks-GroupPickUp-PROD"
  display_name = "WebHooks-GroupPickUp-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-GroupPickUp" {
  topic_arn = aws_sns_topic.WebHooks-GroupPickUp.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-FolioQueue-PROD"
}

# SNS Topic WebHooks WebHooks-ReservationDeleted
resource "aws_sns_topic" "WebHooks-ReservationDeleted" {
  name         = "WebHooks-ReservationDeleted-PROD"
  display_name = "WebHooks-ReservationDeleted-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationDeleted" {
  topic_arn = aws_sns_topic.WebHooks-ReservationDeleted.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-FolioQueue-PROD"
  filter_policy = <<POLICY
                  {
                    "publisherid": ["steblynskyi.reservations.api"]
                  }
                  POLICY
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationDeleted-TO-Task-Reservation-Updated" {
  topic_arn = aws_sns_topic.WebHooks-ReservationDeleted.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Reservation-Updated-PROD"
}

#resource "aws_sns_topic_subscription" "WebHooks-ReservationDeleted-WebHooks-MessagingQueue" {
#  topic_arn = aws_sns_topic.WebHooks-ReservationDeleted.arn
#  protocol  = "sqs"
#  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-MessagingQueue-PROD"
#}

# SNS Topic WebHooks WebHooks-RatePlanCreated
resource "aws_sns_topic" "WebHooks-RatePlanCreated" {
  name         = "WebHooks-RatePlanCreated-PROD"
  display_name = "WebHooks-RatePlanCreated-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-RatePlanCreated" {
  topic_arn = aws_sns_topic.WebHooks-RatePlanCreated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-PROD"
}

# SNS Topic WebHooks WebHooks-RatePlanUpdated
resource "aws_sns_topic" "WebHooks-RatePlanUpdated" {
  name         = "WebHooks-RatePlanUpdated-PROD"
  display_name = "WebHooks-RatePlanUpdated-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-RatePlanUpdated" {
  topic_arn = aws_sns_topic.WebHooks-RatePlanUpdated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-PROD"
}

# SNS Topic WebHooks WebHooks-RatePlanDeleted
resource "aws_sns_topic" "WebHooks-RatePlanDeleted" {
  name         = "WebHooks-RatePlanDeleted-PROD"
  display_name = "WebHooks-RatePlanDeleted-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-RatePlanDeleted" {
  topic_arn = aws_sns_topic.WebHooks-RatePlanDeleted.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-PROD"
}

# SNS Topic WebHooks WebHooks-PropertyCreated
resource "aws_sns_topic" "WebHooks-PropertyCreated" {
  name         = "WebHooks-PropertyCreated-PROD"
  display_name = "WebHooks-PropertyCreated-PROD"
}
// comment subscription for now
//resource "aws_sns_topic_subscription" "WebHooks-PropertyCreated" {
//  topic_arn = aws_sns_topic.WebHooks-PropertyCreated.arn
//  protocol  = "sqs"
//  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-PROD"
//}

# SNS Topic WebHooks WebHooks-PropertyUpdated
resource "aws_sns_topic" "WebHooks-PropertyUpdated" {
  name         = "WebHooks-PropertyUpdated-PROD"
  display_name = "WebHooks-PropertyUpdated-PROD"
}

// comment subscription for now
//resource "aws_sns_topic_subscription" "WebHooks-PropertyUpdated" {
//  topic_arn = aws_sns_topic.WebHooks-PropertyUpdated.arn
//  protocol  = "sqs"
//  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-PROD"
//}

# SNS Topic WebHooks WebHooks-RatePlanOverride
resource "aws_sns_topic" "WebHooks-RatePlanOverride" {
  name         = "WebHooks-RatePlanOverride-PROD"
  display_name = "WebHooks-RatePlanOverride-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-RatePlanOverride" {
  topic_arn = aws_sns_topic.WebHooks-RatePlanOverride.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-PROD"
}

# SNS Topic WebHooks WebHooks-ProductBundleCreated
resource "aws_sns_topic" "WebHooks-ProductBundleCreated" {
  name         = "WebHooks-ProductBundleCreated-PROD"
  display_name = "WebHooks-ProductBundleCreated-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-ProductBundleCreated" {
  topic_arn = aws_sns_topic.WebHooks-ProductBundleCreated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-PROD"
}

# SNS Topic WebHooks WebHooks-ProductBundleUpdated
resource "aws_sns_topic" "WebHooks-ProductBundleUpdated" {
  name         = "WebHooks-ProductBundleUpdated-PROD"
  display_name = "WebHooks-ProductBundleUpdated-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-ProductBundleUpdated" {
  topic_arn = aws_sns_topic.WebHooks-ProductBundleUpdated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-PROD"
}

# SNS Topic WebHooks WebHooks-ProductBundleDeleted
resource "aws_sns_topic" "WebHooks-ProductBundleDeleted" {
  name         = "WebHooks-ProductBundleDeleted-PROD"
  display_name = "WebHooks-ProductBundleDeleted-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-ProductBundleDeleted" {
  topic_arn = aws_sns_topic.WebHooks-ProductBundleDeleted.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-PROD"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationsQueue" {
  topic_arn = aws_sns_topic.WebHooks-ReservationCreated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-ReservationsQueue-PROD"
}

# SNS Topic WebHooks WebHooks-RateOverride
resource "aws_sns_topic" "WebHooks-RateOverride" {
  name         = "WebHooks-RateOverride-PROD"
  display_name = "WebHooks-RateOverride-PROD"
}
resource "aws_sns_topic_subscription" "WebHooks-RateOverride" {
  topic_arn = aws_sns_topic.WebHooks-RateOverride.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-PROD"
}

# SNS Topic WebHooks WebHooks-RuleOverride
resource "aws_sns_topic" "WebHooks-RuleOverride" {
  name         = "WebHooks-RuleOverride-PROD"
  display_name = "WebHooks-RuleOverride-PROD"
}
resource "aws_sns_topic_subscription" "WebHooks-RuleOverride" {
  topic_arn = aws_sns_topic.WebHooks-RuleOverride.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-PROD"
}

# SNS Topic Create-Folio-QA
resource "aws_sns_topic" "Create-Folio" {
  name         = "Create-Folio-PROD"
  display_name = "Create-Folio-PROD"
}

resource "aws_sns_topic_subscription" "Create-Folio" {
  topic_arn = aws_sns_topic.Create-Folio.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Folio-Background-Queue-PROD"
}

# SNS Topic Reservation-Status-Update
resource "aws_sns_topic" "Reservation-Status-Update" {
  name         = "Reservation-Status-Update-PROD"
  display_name = "Reservation-Status-Update-PROD"
}

resource "aws_sns_topic_subscription" "Reservation-Status-Update" {
  topic_arn = aws_sns_topic.Reservation-Status-Update.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Reservation-Background-Queue-PROD"
}

# Mass Transit Topic subscriptions

resource "aws_sns_topic_subscription" "MT-Reservation-Updated-Event" {
  topic_arn = "arn:aws:sns:us-east-1:123:MT-ReservationUpdatedEvent-PROD.fifo"
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Command-AllEvents-PROD.fifo"
  raw_message_delivery = true
}

resource "aws_sns_topic_subscription" "MT-Reservation-Quote-Created-Event" {
  topic_arn = "arn:aws:sns:us-east-1:123:MT-ReservationQuoteCreatedEvent-PROD.fifo"
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Command-AllEvents-PROD.fifo"
  raw_message_delivery = true
}

resource "aws_sns_topic_subscription" "MT-Reservation-ParkingLot-Updated-Event" {
  topic_arn = "arn:aws:sns:us-east-1:123:MT-ReservationParkingLotUpdatedEvent-PROD.fifo"
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Command-AllEvents-PROD.fifo"
  raw_message_delivery = true
}

resource "aws_sns_topic_subscription" "MT-Reservation-Deleted-Event" {
  topic_arn = "arn:aws:sns:us-east-1:123:MT-ReservationDeletedEvent-PROD.fifo"
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Command-AllEvents-PROD.fifo"
  raw_message_delivery = true
}

resource "aws_sns_topic_subscription" "MT-Reservation-Created-Event" {
  topic_arn = "arn:aws:sns:us-east-1:123:MT-ReservationCreatedEvent-PROD.fifo"
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Command-AllEvents-PROD.fifo"
  raw_message_delivery = true
}

resource "aws_sns_topic_subscription" "MT-Reservation-CheckedOut-Event" {
  topic_arn = "arn:aws:sns:us-east-1:123:MT-ReservationCheckedOutEvent-PROD.fifo"
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Command-AllEvents-PROD.fifo"
  raw_message_delivery = true
}

resource "aws_sns_topic_subscription" "MT-Reservation-CheckIn-Event" {
  topic_arn = "arn:aws:sns:us-east-1:123:MT-ReservationCheckedInEvent-PROD.fifo"
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Command-AllEvents-PROD.fifo"
  raw_message_delivery = true
}