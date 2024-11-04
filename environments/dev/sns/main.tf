# SNS Topic Housekeeping-Room-Import
resource "aws_sns_topic" "Pms-Housekeeping-Room-Import" {
  name         = "Pms-Housekeeping-Room-Import-DEV"
  display_name = "Pms-Housekeeping-Room-Import-DEV"
}


# SNS Topic Housekeeping-Room-Condition-Updated
resource "aws_sns_topic" "Pms-Housekeeping-Room-Condition-Updated" {
  name         = "Pms-Housekeeping-Room-Condition-Updated-DEV"
  display_name = "Pms-Housekeeping-Room-Condition-Updated-DEV"
}


# SNS Topic Task-New-Created
resource "aws_sns_topic" "Pms-Task-New-Created" {
  name         = "Pms-Task-New-Created-DEV"
  display_name = "Pms-Task-New-Created-DEV"
}


# SNS Topic Task-Notes-Import
resource "aws_sns_topic" "Pms-Task-Notes-Import" {
  name         = "Pms-Task-Notes-Import-DEV"
  display_name = "Pms-Task-Notes-Import-DEV"
}


# SNS Topic Task-Property-Import-Publisher
resource "aws_sns_topic" "Pms-Task-Property-Import-Publisher" {
  name         = "Pms-Task-Property-Import-Publisher-DEV"
  display_name = "Pms-Task-Property-Import-Publisher-DEV"
}


# SNS Topic Task-Roles-Import
resource "aws_sns_topic" "Pms-Task-Roles-Import" {
  name         = "Pms-Task-Roles-Import-DEV"
  display_name = "Pms-Task-Roles-Import-DEV"
}


# SNS Topic Task-Staff-Import
resource "aws_sns_topic" "Pms-Task-Staff-Import" {
  name         = "Pms-Task-Staff-Import-DEV"
  display_name = "Pms-Task-Staff-Import-DEV"
}


# SNS Topic Task-Assigned
resource "aws_sns_topic" "Pms-Task-Assigned" {
  name         = "Pms-Task-Assigned-DEV"
  display_name = "Pms-Task-Assigned-DEV"
}


# SNS Topic Task-Deleted
resource "aws_sns_topic" "Pms-Task-Deleted" {
  name         = "Pms-Task-Deleted-DEV"
  display_name = "Pms-Task-Deleted-DEV"
}


# SNS Topic Task-Details-Updated
resource "aws_sns_topic" "Pms-Task-Details-Updated" {
  name         = "Pms-Task-Details-Updated-DEV"
  display_name = "Pms-Task-Details-Updated-DEV"
}


# SNS Topic Task-Remark-Added
resource "aws_sns_topic" "Pms-Task-Remark-Added" {
  name         = "Pms-Task-Remark-Added-DEV"
  display_name = "Pms-Task-Remark-Added-DEV"
}


# SNS Topic Task-Status-Updated
resource "aws_sns_topic" "Pms-Task-Status-Updated" {
  name         = "Pms-Task-Status-Updated-DEV"
  display_name = "Pms-Task-Status-Updated-DEV"
}


# SNS Topic Task-Unassigned
resource "aws_sns_topic" "Pms-Task-Unassigned" {
  name         = "Pms-Task-Unassigned-DEV"
  display_name = "Pms-Task-Unassigned-DEV"
}


# SNS Topic Task-Update-Room-Condition
resource "aws_sns_topic" "Pms-Task-Update-Room-Condition" {
  name         = "Pms-Task-Update-Room-Condition-DEV"
  display_name = "Pms-Task-Update-Room-Condition-DEV"
}


# SNS Topic Email-Innsights
resource "aws_sns_topic" "Email-Innsights" {
  name         = "Email-Innsights-DEV"
  display_name = "Email-Innsights-DEV"
}

resource "aws_sns_topic_subscription" "Email-Innsights" {
  topic_arn                       = "arn:aws:sns:us-east-1:123:Email-Innsights-DEV"
  protocol                        = "https"
  endpoint_auto_confirms          = "true"
  confirmation_timeout_in_minutes = "5"
  endpoint                        = "https://pms-innsights-web-api.dev-steblynskyi.com/innsights/api/sns/RaiseEmailEvent"
}


# SNS Topic Task-Importrole-Handler
resource "aws_sns_topic" "Pms-Task-Importrole-Handler" {
  name         = "Pms-Task-Importrole-Handler-DEV"
  display_name = "Pms-Task-Importrole-Handler-DEV"
}


# SNS Topic Email-API
resource "aws_sns_topic" "Email-API" {
  name         = "Email-API-DEV"
  display_name = "Email-API-DEV"
}

resource "aws_sns_topic_subscription" "Email-API" {
  topic_arn                       = "arn:aws:sns:us-east-1:123:Email-API-DEV"
  protocol                        = "https"
  endpoint_auto_confirms          = "true"
  confirmation_timeout_in_minutes = "5"
  endpoint                        = "https://pms-email-api.dev-steblynskyi.com/api/AwsSesNotifications/notify"
}


# SNS Topic integrations-email-api
resource "aws_sns_topic" "Integrations-Email-API-SesDeliveryNotifications" {
  name         = "Integrations-Email-API-SesDeliveryNotifications-DEV"
  display_name = "Integrations-Email-API-SesDeliveryNotifications-DEV"
}

resource "aws_sns_topic_subscription" "Integrations-Email-API-SesDeliveryNotifications" {
  topic_arn = "arn:aws:sns:us-east-1:123:Integrations-Email-API-SesDeliveryNotifications-DEV"
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Integrations-Email-API-SesDeliveryNotifications-DEV"
}


# SNS Topic WebHooks-ReservationCreated
resource "aws_sns_topic" "WebHooks-ReservationCreated" {
  name         = "WebHooks-ReservationCreated-DEV"
  display_name = "WebHooks-ReservationCreated-DEV"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationCreated-InnSights-WebHookQueue-DEV" {
  topic_arn = aws_sns_topic.WebHooks-ReservationCreated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:InnSights-WebHookQueue-DEV"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationCreated-Task-Reservation-Updated-DEV" {
  topic_arn = aws_sns_topic.WebHooks-ReservationCreated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Reservation-Updated-DEV"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationCreated-WebHooks-ReservationsQueue" {
  topic_arn = aws_sns_topic.WebHooks-ReservationCreated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-ReservationsQueue-DEV"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationCreated-Akia-ReservationsQueue" {
  topic_arn = aws_sns_topic.WebHooks-ReservationCreated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Akia-ReservationQueue-POC-Dev"
}


# SNS Topic WebHooks-ReservationUpdated
resource "aws_sns_topic" "WebHooks-ReservationUpdated" {
  name         = "WebHooks-ReservationUpdated-DEV"
  display_name = "WebHooks-ReservationUpdated-DEV"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationUpdated-InnSights-WebHookQueue-DEV" {
  topic_arn = aws_sns_topic.WebHooks-ReservationUpdated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:InnSights-WebHookQueue-DEV"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationUpdated-Task-Reservation-Updated" {
  topic_arn = aws_sns_topic.WebHooks-ReservationUpdated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Reservation-Updated-DEV"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationUpdated-Akia-ReservationsQueue" {
  topic_arn = aws_sns_topic.WebHooks-ReservationUpdated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Akia-ReservationQueue-POC-Dev"
}


# SNS Topic WebHooks-GroupBlockCreate
resource "aws_sns_topic" "WebHooks-GroupBlockCreate" {
  name         = "WebHooks-GroupBlockCreate-DEV"
  display_name = "WebHooks-GroupBlockCreate-DEV"
}

resource "aws_sns_topic_subscription" "WebHooks-GroupBlockCreate" {
  topic_arn = aws_sns_topic.WebHooks-GroupBlockCreate.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:InnSights-WebHookQueue-DEV"
}


# SNS Topic WebHooks-GroupBlockUpdate
resource "aws_sns_topic" "WebHooks-GroupBlockUpdate" {
  name         = "WebHooks-GroupBlockUpdate-DEV"
  display_name = "WebHooks-GroupBlockUpdate-DEV"
}

resource "aws_sns_topic_subscription" "WebHooks-GroupBlockUpdate" {
  topic_arn = aws_sns_topic.WebHooks-GroupBlockUpdate.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:InnSights-WebHookQueue-DEV"
}


# SNS Topic WebHooks-RoomMaintenanceCreate
resource "aws_sns_topic" "WebHooks-RoomMaintenanceCreate" {
  name         = "WebHooks-RoomMaintenanceCreate-DEV"
  display_name = "WebHooks-RoomMaintenanceCreate-DEV"
}

resource "aws_sns_topic_subscription" "WebHooks-RoomMaintenanceCreate" {
  topic_arn = aws_sns_topic.WebHooks-RoomMaintenanceCreate.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:InnSights-WebHookQueue-DEV"
}


# SNS Topic WebHooks-RoomMaintenanceUpdate
resource "aws_sns_topic" "WebHooks-RoomMaintenanceUpdate" {
  name         = "WebHooks-RoomMaintenanceUpdate-DEV"
  display_name = "WebHooks-RoomMaintenanceUpdate-DEV"
}

resource "aws_sns_topic_subscription" "WebHooks-RoomMaintenanceUpdate" {
  topic_arn = aws_sns_topic.WebHooks-RoomMaintenanceUpdate.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:InnSights-WebHookQueue-DEV"
}


# SNS Topic WebHooks ReservationCheckedIn
resource "aws_sns_topic" "WebHooks-ReservationCheckedIn" {
  name         = "WebHooks-ReservationCheckedIn-DEV"
  display_name = "WebHooks-ReservationCheckedIn-DEV"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationCheckedIn" {
  topic_arn = aws_sns_topic.WebHooks-ReservationCheckedIn.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Reservation-Updated-DEV"
}


resource "aws_sns_topic_subscription" "WebHooks-ReservationCheckedIn-Akia-ReservationsQueue" {
  topic_arn = aws_sns_topic.WebHooks-ReservationCheckedIn.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Akia-ReservationQueue-POC-Dev"
}


# SNS Topic WebHooks ReservationCheckedOut
resource "aws_sns_topic" "WebHooks-ReservationCheckedOut" {
  name         = "WebHooks-ReservationCheckedOut-DEV"
  display_name = "WebHooks-ReservationCheckedOut-DEV"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationCheckedOut" {
  topic_arn = aws_sns_topic.WebHooks-ReservationCheckedOut.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Reservation-Updated-DEV"
}


resource "aws_sns_topic_subscription" "WebHooks-ReservationCheckedOut-Akia-ReservationsQueue" {
  topic_arn = aws_sns_topic.WebHooks-ReservationCheckedOut.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Akia-ReservationQueue-POC-Dev"
}


# SNS Topic WebHooks ReservationParkingLotUpdated
resource "aws_sns_topic" "WebHooks-ReservationParkingLotUpdated" {
  name         = "WebHooks-ReservationParkingLotUpdated-DEV"
  display_name = "WebHooks-ReservationParkingLotUpdated-DEV"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationParkingLotUpdated" {
  topic_arn = aws_sns_topic.WebHooks-ReservationParkingLotUpdated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Reservation-Updated-DEV"
}


# SNS Topic WebHooks ReservationQuoteCreated
resource "aws_sns_topic" "WebHooks-ReservationQuoteCreated" {
  name         = "WebHooks-ReservationQuoteCreated-DEV"
  display_name = "WebHooks-ReservationQuoteCreated-DEV"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationQuoteCreated" {
  topic_arn = aws_sns_topic.WebHooks-ReservationQuoteCreated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Reservation-Updated-DEV"
}


# SNS Topic WebHooks WebHooks-FolioCreated
resource "aws_sns_topic" "WebHooks-FolioCreated" {
  name         = "WebHooks-FolioCreated-DEV"
  display_name = "WebHooks-FolioCreated-DEV"
}


# SNS Topic WebHooks WebHooks-FolioUpdated
resource "aws_sns_topic" "WebHooks-FolioUpdated" {
  name         = "WebHooks-FolioUpdated-DEV"
  display_name = "WebHooks-FolioUpdated-DEV"
}


# SNS Topic WebHooks WebHooks-GroupPickUp
resource "aws_sns_topic" "WebHooks-GroupPickUp" {
  name         = "WebHooks-GroupPickUp-DEV"
  display_name = "WebHooks-GroupPickUp-DEV"
}


# SNS Topic WebHooks WebHooks-ReservationDeleted
resource "aws_sns_topic" "WebHooks-ReservationDeleted" {
  name         = "WebHooks-ReservationDeleted-DEV"
  display_name = "WebHooks-ReservationDeleted-DEV"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationDeleted-Task-Reservation-Updated-DEV" {
  topic_arn = aws_sns_topic.WebHooks-ReservationDeleted.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Reservation-Updated-DEV"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationDeleted-Akia-ReservationsQueue" {
  topic_arn = aws_sns_topic.WebHooks-ReservationDeleted.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Akia-ReservationQueue-POC-Dev"
}


# SNS Topic WebHooks WebHooks-RatePlanCreated
resource "aws_sns_topic" "WebHooks-RatePlanCreated" {
  name         = "WebHooks-RatePlanCreated-DEV"
  display_name = "WebHooks-RatePlanCreated-DEV"
}

resource "aws_sns_topic_subscription" "WebHooks-RatePlanCreated" {
  topic_arn = aws_sns_topic.WebHooks-RatePlanCreated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-DEV"
}


# SNS Topic WebHooks WebHooks-RatePlanUpdated
resource "aws_sns_topic" "WebHooks-RatePlanUpdated" {
  name         = "WebHooks-RatePlanUpdated-DEV"
  display_name = "WebHooks-RatePlanUpdated-DEV"
}

resource "aws_sns_topic_subscription" "WebHooks-RatePlanUpdated" {
  topic_arn = aws_sns_topic.WebHooks-RatePlanUpdated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-DEV"
}


# SNS Topic WebHooks WebHooks-RatePlanDeleted
resource "aws_sns_topic" "WebHooks-RatePlanDeleted" {
  name         = "WebHooks-RatePlanDeleted-DEV"
  display_name = "WebHooks-RatePlanDeleted-DEV"
}

resource "aws_sns_topic_subscription" "WebHooks-RatePlanDeleted" {
  topic_arn = aws_sns_topic.WebHooks-RatePlanDeleted.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-DEV"
}


# SNS Topic WebHooks WebHooks-RatePlanOverride
resource "aws_sns_topic" "WebHooks-RatePlanOverride" {
  name         = "WebHooks-RatePlanOverride-DEV"
  display_name = "WebHooks-RatePlanOverride-DEV"
}

resource "aws_sns_topic_subscription" "WebHooks-RatePlanOverride" {
  topic_arn = aws_sns_topic.WebHooks-RatePlanOverride.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-DEV"
}


# SNS Topic WebHooks WebHooks-PropertyCreated
resource "aws_sns_topic" "WebHooks-PropertyCreated" {
  name         = "WebHooks-PropertyCreated-DEV"
  display_name = "WebHooks-PropertyCreated-DEV"
}


# SNS Topic WebHooks WebHooks-PropertyUpdated
resource "aws_sns_topic" "WebHooks-PropertyUpdated" {
  name         = "WebHooks-PropertyUpdated-DEV"
  display_name = "WebHooks-PropertyUpdated-DEV"
}


# SNS Topic WebHooks WebHooks-ProductBundleCreated
resource "aws_sns_topic" "WebHooks-ProductBundleCreated" {
  name         = "WebHooks-ProductBundleCreated-DEV"
  display_name = "WebHooks-ProductBundleCreated-DEV"
}

resource "aws_sns_topic_subscription" "WebHooks-ProductBundleCreated" {
  topic_arn = aws_sns_topic.WebHooks-ProductBundleCreated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-DEV"
}


# SNS Topic WebHooks WebHooks-ProductBundleUpdated
resource "aws_sns_topic" "WebHooks-ProductBundleUpdated" {
  name         = "WebHooks-ProductBundleUpdated-DEV"
  display_name = "WebHooks-ProductBundleUpdated-DEV"
}

resource "aws_sns_topic_subscription" "WebHooks-ProductBundleUpdated" {
  topic_arn = aws_sns_topic.WebHooks-ProductBundleUpdated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-DEV"
}


# SNS Topic WebHooks WebHooks-ProductBundleDeleted
resource "aws_sns_topic" "WebHooks-ProductBundleDeleted" {
  name         = "WebHooks-ProductBundleDeleted-DEV"
  display_name = "WebHooks-ProductBundleDeleted-DEV"
}
resource "aws_sns_topic_subscription" "WebHooks-ProductBundleDeleted" {
  topic_arn = aws_sns_topic.WebHooks-ProductBundleDeleted.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-DEV"
}


# SNS Topic WebHooks WebHooks-RateOverride
resource "aws_sns_topic" "WebHooks-RateOverride" {
  name         = "WebHooks-RateOverride-DEV"
  display_name = "WebHooks-RateOverride-DEV"
}

resource "aws_sns_topic_subscription" "WebHooks-RateOverride" {
  topic_arn = aws_sns_topic.WebHooks-RateOverride.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-DEV"
}


# SNS Topic WebHooks WebHooks-RuleOverride
resource "aws_sns_topic" "WebHooks-RuleOverride" {
  name         = "WebHooks-RuleOverride-DEV"
  display_name = "WebHooks-RuleOverride-DEV"
}

resource "aws_sns_topic_subscription" "WebHooks-RuleOverride" {
  topic_arn = aws_sns_topic.WebHooks-RuleOverride.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-DEV"
}


# SNS Topic WebHooks Create-Folio-DEV
resource "aws_sns_topic" "Create-Folio" {
  name         = "Create-Folio-DEV"
  display_name = "Create-Folio-DEV"
}

resource "aws_sns_topic_subscription" "Create-Folio" {
  topic_arn = aws_sns_topic.Create-Folio.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Folio-Background-Queue-DEV"
}


# SNS Topic WebHooks Reservation-Status-Update
resource "aws_sns_topic" "Reservation-Status-Update" {
  name         = "Reservation-Status-Update-DEV"
  display_name = "Reservation-Status-Update-DEV"
}

resource "aws_sns_topic_subscription" "Reservation-Status-Update" {
  topic_arn = aws_sns_topic.Reservation-Status-Update.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Reservation-Background-Queue-DEV"
}


# Mass Transit Topic subscriptions
resource "aws_sns_topic_subscription" "MT-Reservation-Updated-Event" {
  topic_arn = "arn:aws:sns:us-east-1:123:MT-ReservationUpdatedEvent-DEV.fifo"
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Command-AllEvents-DEV.fifo"
  raw_message_delivery = true
}

resource "aws_sns_topic_subscription" "MT-Reservation-Quote-Created-Event" {
  topic_arn = "arn:aws:sns:us-east-1:123:MT-ReservationQuoteCreatedEvent-DEV.fifo"
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Command-AllEvents-DEV.fifo"
  raw_message_delivery = true
}

resource "aws_sns_topic_subscription" "MT-Reservation-ParkingLot-Updated-Event" {
  topic_arn = "arn:aws:sns:us-east-1:123:MT-ReservationParkingLotUpdatedEvent-DEV.fifo"
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Command-AllEvents-DEV.fifo"
  raw_message_delivery = true
}

resource "aws_sns_topic_subscription" "MT-Reservation-Deleted-Event" {
  topic_arn = "arn:aws:sns:us-east-1:123:MT-ReservationDeletedEvent-DEV.fifo"
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Command-AllEvents-DEV.fifo"
  raw_message_delivery = true
}

resource "aws_sns_topic_subscription" "MT-Reservation-Created-Event" {
  topic_arn = "arn:aws:sns:us-east-1:123:MT-ReservationCreatedEvent-DEV.fifo"
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Command-AllEvents-DEV.fifo"
  raw_message_delivery = true
}

resource "aws_sns_topic_subscription" "MT-Reservation-CheckedOut-Event" {
  topic_arn = "arn:aws:sns:us-east-1:123:MT-ReservationCheckedOutEvent-DEV.fifo"
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Command-AllEvents-DEV.fifo"
  raw_message_delivery = true
}

resource "aws_sns_topic_subscription" "MT-Reservation-CheckIn-Event" {
  topic_arn = "arn:aws:sns:us-east-1:123:MT-ReservationCheckedInEvent-DEV.fifo"
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Command-AllEvents-DEV.fifo"
  raw_message_delivery = true
}
