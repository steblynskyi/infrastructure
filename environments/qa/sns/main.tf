# SNS Topic Housekeeping-Room-Import
resource "aws_sns_topic" "Pms-Housekeeping-Room-Import" {
  name         = "Pms-Housekeeping-Room-Import-QA"
  display_name = "Pms-Housekeeping-Room-Import-QA"
}


# SNS Topic Housekeeping-Room-Condition-Updated
resource "aws_sns_topic" "Pms-Housekeeping-Room-Condition-Updated" {
  name         = "Pms-Housekeeping-Room-Condition-Updated-QA"
  display_name = "Pms-Housekeeping-Room-Condition-Updated-QA"
}


# SNS Topic Task-New-Created
resource "aws_sns_topic" "Pms-Task-New-Created" {
  name         = "Pms-Task-New-Created-QA"
  display_name = "Pms-Task-New-Created-QA"
}


# SNS Topic Task-Notes-Import
resource "aws_sns_topic" "Pms-Task-Notes-Import" {
  name         = "Pms-Task-Notes-Import-QA"
  display_name = "Pms-Task-Notes-Import-QA"
}


# SNS Topic Task-Property-Import-Publisher
resource "aws_sns_topic" "Pms-Task-Property-Import-Publisher" {
  name         = "Pms-Task-Property-Import-Publisher-QA"
  display_name = "Pms-Task-Property-Import-Publisher-QA"
}


# SNS Topic Task-Roles-Import
resource "aws_sns_topic" "Pms-Task-Roles-Import" {
  name         = "Pms-Task-Roles-Import-QA"
  display_name = "Pms-Task-Roles-Import-QA"
}


# SNS Topic Task-Staff-Import
resource "aws_sns_topic" "Pms-Task-Staff-Import" {
  name         = "Pms-Task-Staff-Import-QA"
  display_name = "Pms-Task-Staff-Import-QA"
}


# SNS Topic Task-Assigned
resource "aws_sns_topic" "Pms-Task-Assigned" {
  name         = "Pms-Task-Assigned-QA"
  display_name = "Pms-Task-Assigned-QA"
}


# SNS Topic Task-Deleted
resource "aws_sns_topic" "Pms-Task-Deleted" {
  name         = "Pms-Task-Deleted-QA"
  display_name = "Pms-Task-Deleted-QA"
}


# SNS Topic Task-Details-Updated
resource "aws_sns_topic" "Pms-Task-Details-Updated" {
  name         = "Pms-Task-Details-Updated-QA"
  display_name = "Pms-Task-Details-Updated-QA"
}


# SNS Topic Task-Remark-Added
resource "aws_sns_topic" "Pms-Task-Remark-Added" {
  name         = "Pms-Task-Remark-Added-QA"
  display_name = "Pms-Task-Remark-Added-QA"
}


# SNS Topic Task-Status-Updated
resource "aws_sns_topic" "Pms-Task-Status-Updated" {
  name         = "Pms-Task-Status-Updated-QA"
  display_name = "Pms-Task-Status-Updated-QA"
}


# SNS Topic Task-Unassigned
resource "aws_sns_topic" "Pms-Task-Unassigned" {
  name         = "Pms-Task-Unassigned-QA"
  display_name = "Pms-Task-Unassigned-QA"
}


# SNS Topic Task-Update-Room-Condition
resource "aws_sns_topic" "Pms-Task-Update-Room-Condition" {
  name         = "Pms-Task-Update-Room-Condition-QA"
  display_name = "Pms-Task-Update-Room-Condition-QA"
}


# SNS Topic Email-Innsights
resource "aws_sns_topic" "Email-Innsights" {
  name         = "Email-Innsights-QA"
  display_name = "Email-Innsights-QA"
}

resource "aws_sns_topic_subscription" "Email-Innsights" {
  topic_arn                       = "arn:aws:sns:us-east-1:123:Email-Innsights-QA"
  protocol                        = "https"
  endpoint_auto_confirms          = "true"
  confirmation_timeout_in_minutes = "5"
  endpoint                        = "https://pms-innsights-web-api.qa-steblynskyi.com/innsights/api/sns/RaiseEmailEvent"
}


# SNS Topic Task-Importrole-Handler
resource "aws_sns_topic" "Pms-Task-Importrole-Handler" {
  name         = "Pms-Task-Importrole-Handler-QA"
  display_name = "Pms-Task-Importrole-Handler-QA"
}


# SNS Topic Email-API
resource "aws_sns_topic" "Email-API" {
  name         = "Email-API-QA"
  display_name = "Email-API-QA"
}

resource "aws_sns_topic_subscription" "Email-API" {
  topic_arn                       = "arn:aws:sns:us-east-1:123:Email-API-QA"
  protocol                        = "https"
  endpoint_auto_confirms          = "true"
  confirmation_timeout_in_minutes = "5"
  endpoint                        = "https://pms-email-api.qa-steblynskyi.com/api/AwsSesNotifications/notify"
}


# SNS Topic integrations-email-api
resource "aws_sns_topic" "Integrations-Email-API-SesDeliveryNotifications" {
  name         = "Integrations-Email-API-SesDeliveryNotifications-QA"
  display_name = "Integrations-Email-API-SesDeliveryNotifications-QA"
}

resource "aws_sns_topic_subscription" "Integrations-Email-API-SesDeliveryNotifications" {
  topic_arn = "arn:aws:sns:us-east-1:123:Integrations-Email-API-SesDeliveryNotifications-QA"
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Integrations-Email-API-SesDeliveryNotifications-QA"
}


# SNS Topic WebHooks-ReservationCreated
resource "aws_sns_topic" "WebHooks-ReservationCreated" {
  name         = "WebHooks-ReservationCreated-QA"
  display_name = "WebHooks-ReservationCreated-QA"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationCreated-InnSights-WebHookQueue-QA" {
  topic_arn = aws_sns_topic.WebHooks-ReservationCreated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:InnSights-WebHookQueue-QA"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationCreated-Task-Reservation-Updated-QA" {
  topic_arn = aws_sns_topic.WebHooks-ReservationCreated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Reservation-Updated-QA"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationCreated-WebHooks-ReservationsQueue" {
  topic_arn = aws_sns_topic.WebHooks-ReservationCreated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-ReservationsQueue-QA"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationCreated-Akia-ReservationsQueue" {
  topic_arn = aws_sns_topic.WebHooks-ReservationCreated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Akia-ReservationQueue-POC-QA"
}


# SNS Topic WebHooks-ReservationUpdated
resource "aws_sns_topic" "WebHooks-ReservationUpdated" {
  name         = "WebHooks-ReservationUpdated-QA"
  display_name = "WebHooks-ReservationUpdated-QA"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationUpdated-InnSights-WebHookQueue-QA" {
  topic_arn = aws_sns_topic.WebHooks-ReservationUpdated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:InnSights-WebHookQueue-QA"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationUpdated-Task-Reservation-Updated" {
  topic_arn = aws_sns_topic.WebHooks-ReservationUpdated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Reservation-Updated-QA"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationUpdated-Akia-ReservationsQueue" {
  topic_arn = aws_sns_topic.WebHooks-ReservationUpdated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Akia-ReservationQueue-POC-QA"
}


# SNS Topic WebHooks-GroupBlockCreate
resource "aws_sns_topic" "WebHooks-GroupBlockCreate" {
  name         = "WebHooks-GroupBlockCreate-QA"
  display_name = "WebHooks-GroupBlockCreate-QA"
}

resource "aws_sns_topic_subscription" "WebHooks-GroupBlockCreate" {
  topic_arn = aws_sns_topic.WebHooks-GroupBlockCreate.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:InnSights-WebHookQueue-QA"
}


# SNS Topic WebHooks-GroupBlockUpdate
resource "aws_sns_topic" "WebHooks-GroupBlockUpdate" {
  name         = "WebHooks-GroupBlockUpdate-QA"
  display_name = "WebHooks-GroupBlockUpdate-QA"
}

resource "aws_sns_topic_subscription" "WebHooks-GroupBlockUpdate" {
  topic_arn = aws_sns_topic.WebHooks-GroupBlockUpdate.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:InnSights-WebHookQueue-QA"
}


# SNS Topic WebHooks-RoomMaintenanceCreate
resource "aws_sns_topic" "WebHooks-RoomMaintenanceCreate" {
  name         = "WebHooks-RoomMaintenanceCreate-QA"
  display_name = "WebHooks-RoomMaintenanceCreate-QA"
}

resource "aws_sns_topic_subscription" "WebHooks-RoomMaintenanceCreate" {
  topic_arn = aws_sns_topic.WebHooks-RoomMaintenanceCreate.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:InnSights-WebHookQueue-QA"
}


# SNS Topic WebHooks-RoomMaintenanceUpdate
resource "aws_sns_topic" "WebHooks-RoomMaintenanceUpdate" {
  name         = "WebHooks-RoomMaintenanceUpdate-QA"
  display_name = "WebHooks-RoomMaintenanceUpdate-QA"
}

resource "aws_sns_topic_subscription" "WebHooks-RoomMaintenanceUpdate" {
  topic_arn = aws_sns_topic.WebHooks-RoomMaintenanceUpdate.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:InnSights-WebHookQueue-QA"
}


# SNS Topic WebHooks ReservationCheckedIn
resource "aws_sns_topic" "WebHooks-ReservationCheckedIn" {
  name         = "WebHooks-ReservationCheckedIn-QA"
  display_name = "WebHooks-ReservationCheckedIn-QA"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationCheckedIn" {
  topic_arn = aws_sns_topic.WebHooks-ReservationCheckedIn.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Reservation-Updated-QA"
}


resource "aws_sns_topic_subscription" "WebHooks-ReservationCheckedIn-Akia-ReservationsQueue" {
  topic_arn = aws_sns_topic.WebHooks-ReservationCheckedIn.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Akia-ReservationQueue-POC-QA"
}


# SNS Topic WebHooks ReservationCheckedOut
resource "aws_sns_topic" "WebHooks-ReservationCheckedOut" {
  name         = "WebHooks-ReservationCheckedOut-QA"
  display_name = "WebHooks-ReservationCheckedOut-QA"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationCheckedOut" {
  topic_arn = aws_sns_topic.WebHooks-ReservationCheckedOut.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Reservation-Updated-QA"
}


resource "aws_sns_topic_subscription" "WebHooks-ReservationCheckedOut-Akia-ReservationsQueue" {
  topic_arn = aws_sns_topic.WebHooks-ReservationCheckedOut.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Akia-ReservationQueue-POC-QA"
}


# SNS Topic WebHooks ReservationParkingLotUpdated
resource "aws_sns_topic" "WebHooks-ReservationParkingLotUpdated" {
  name         = "WebHooks-ReservationParkingLotUpdated-QA"
  display_name = "WebHooks-ReservationParkingLotUpdated-QA"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationParkingLotUpdated" {
  topic_arn = aws_sns_topic.WebHooks-ReservationParkingLotUpdated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Reservation-Updated-QA"
}


# SNS Topic WebHooks ReservationQuoteCreated
resource "aws_sns_topic" "WebHooks-ReservationQuoteCreated" {
  name         = "WebHooks-ReservationQuoteCreated-QA"
  display_name = "WebHooks-ReservationQuoteCreated-QA"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationQuoteCreated" {
  topic_arn = aws_sns_topic.WebHooks-ReservationQuoteCreated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Reservation-Updated-QA"
}


# SNS Topic WebHooks WebHooks-FolioCreated
resource "aws_sns_topic" "WebHooks-FolioCreated" {
  name         = "WebHooks-FolioCreated-QA"
  display_name = "WebHooks-FolioCreated-QA"
}


# SNS Topic WebHooks WebHooks-FolioUpdated
resource "aws_sns_topic" "WebHooks-FolioUpdated" {
  name         = "WebHooks-FolioUpdated-QA"
  display_name = "WebHooks-FolioUpdated-QA"
}


# SNS Topic WebHooks WebHooks-GroupPickUp
resource "aws_sns_topic" "WebHooks-GroupPickUp" {
  name         = "WebHooks-GroupPickUp-QA"
  display_name = "WebHooks-GroupPickUp-QA"
}


# SNS Topic WebHooks WebHooks-ReservationDeleted
resource "aws_sns_topic" "WebHooks-ReservationDeleted" {
  name         = "WebHooks-ReservationDeleted-QA"
  display_name = "WebHooks-ReservationDeleted-QA"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationDeleted-Task-Reservation-Updated-QA" {
  topic_arn = aws_sns_topic.WebHooks-ReservationDeleted.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Reservation-Updated-QA"
}

resource "aws_sns_topic_subscription" "WebHooks-ReservationDeleted-Akia-ReservationsQueue" {
  topic_arn = aws_sns_topic.WebHooks-ReservationDeleted.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Akia-ReservationQueue-POC-QA"
}


# SNS Topic WebHooks WebHooks-RatePlanCreated
resource "aws_sns_topic" "WebHooks-RatePlanCreated" {
  name         = "WebHooks-RatePlanCreated-QA"
  display_name = "WebHooks-RatePlanCreated-QA"
}

resource "aws_sns_topic_subscription" "WebHooks-RatePlanCreated" {
  topic_arn = aws_sns_topic.WebHooks-RatePlanCreated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-QA"
}


# SNS Topic WebHooks WebHooks-RatePlanUpdated
resource "aws_sns_topic" "WebHooks-RatePlanUpdated" {
  name         = "WebHooks-RatePlanUpdated-QA"
  display_name = "WebHooks-RatePlanUpdated-QA"
}

resource "aws_sns_topic_subscription" "WebHooks-RatePlanUpdated" {
  topic_arn = aws_sns_topic.WebHooks-RatePlanUpdated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-QA"
}


# SNS Topic WebHooks WebHooks-RatePlanDeleted
resource "aws_sns_topic" "WebHooks-RatePlanDeleted" {
  name         = "WebHooks-RatePlanDeleted-QA"
  display_name = "WebHooks-RatePlanDeleted-QA"
}

resource "aws_sns_topic_subscription" "WebHooks-RatePlanDeleted" {
  topic_arn = aws_sns_topic.WebHooks-RatePlanDeleted.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-QA"
}


# SNS Topic WebHooks WebHooks-RatePlanOverride
resource "aws_sns_topic" "WebHooks-RatePlanOverride" {
  name         = "WebHooks-RatePlanOverride-QA"
  display_name = "WebHooks-RatePlanOverride-QA"
}

resource "aws_sns_topic_subscription" "WebHooks-RatePlanOverride" {
  topic_arn = aws_sns_topic.WebHooks-RatePlanOverride.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-QA"
}


# SNS Topic WebHooks WebHooks-PropertyCreated
resource "aws_sns_topic" "WebHooks-PropertyCreated" {
  name         = "WebHooks-PropertyCreated-QA"
  display_name = "WebHooks-PropertyCreated-QA"
}


# SNS Topic WebHooks WebHooks-PropertyUpdated
resource "aws_sns_topic" "WebHooks-PropertyUpdated" {
  name         = "WebHooks-PropertyUpdated-QA"
  display_name = "WebHooks-PropertyUpdated-QA"
}


# SNS Topic WebHooks WebHooks-ProductBundleCreated
resource "aws_sns_topic" "WebHooks-ProductBundleCreated" {
  name         = "WebHooks-ProductBundleCreated-QA"
  display_name = "WebHooks-ProductBundleCreated-QA"
}

resource "aws_sns_topic_subscription" "WebHooks-ProductBundleCreated" {
  topic_arn = aws_sns_topic.WebHooks-ProductBundleCreated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-QA"
}


# SNS Topic WebHooks WebHooks-ProductBundleUpdated
resource "aws_sns_topic" "WebHooks-ProductBundleUpdated" {
  name         = "WebHooks-ProductBundleUpdated-QA"
  display_name = "WebHooks-ProductBundleUpdated-QA"
}

resource "aws_sns_topic_subscription" "WebHooks-ProductBundleUpdated" {
  topic_arn = aws_sns_topic.WebHooks-ProductBundleUpdated.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-QA"
}


# SNS Topic WebHooks WebHooks-ProductBundleDeleted
resource "aws_sns_topic" "WebHooks-ProductBundleDeleted" {
  name         = "WebHooks-ProductBundleDeleted-QA"
  display_name = "WebHooks-ProductBundleDeleted-QA"
}
resource "aws_sns_topic_subscription" "WebHooks-ProductBundleDeleted" {
  topic_arn = aws_sns_topic.WebHooks-ProductBundleDeleted.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-QA"
}


# SNS Topic WebHooks WebHooks-RateOverride
resource "aws_sns_topic" "WebHooks-RateOverride" {
  name         = "WebHooks-RateOverride-QA"
  display_name = "WebHooks-RateOverride-QA"
}

resource "aws_sns_topic_subscription" "WebHooks-RateOverride" {
  topic_arn = aws_sns_topic.WebHooks-RateOverride.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-QA"
}


# SNS Topic WebHooks WebHooks-RuleOverride
resource "aws_sns_topic" "WebHooks-RuleOverride" {
  name         = "WebHooks-RuleOverride-QA"
  display_name = "WebHooks-RuleOverride-QA"
}

resource "aws_sns_topic_subscription" "WebHooks-RuleOverride" {
  topic_arn = aws_sns_topic.WebHooks-RuleOverride.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:WebHooks-RatePlanQueue-QA"
}


# SNS Topic WebHooks Create-Folio-QA
resource "aws_sns_topic" "Create-Folio" {
  name         = "Create-Folio-QA"
  display_name = "Create-Folio-QA"
}

resource "aws_sns_topic_subscription" "Create-Folio" {
  topic_arn = aws_sns_topic.Create-Folio.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Folio-Background-Queue-QA"
}


# SNS Topic WebHooks Reservation-Status-Update
resource "aws_sns_topic" "Reservation-Status-Update" {
  name         = "Reservation-Status-Update-QA"
  display_name = "Reservation-Status-Update-QA"
}

resource "aws_sns_topic_subscription" "Reservation-Status-Update" {
  topic_arn = aws_sns_topic.Reservation-Status-Update.arn
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Reservation-Background-Queue-QA"
}


# Mass Transit Topic subscriptions
resource "aws_sns_topic_subscription" "MT-Reservation-Updated-Event" {
  topic_arn = "arn:aws:sns:us-east-1:123:MT-ReservationUpdateqaent-QA.fifo"
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Command-AllEvents-QA.fifo"
  raw_message_delivery = true
}

resource "aws_sns_topic_subscription" "MT-Reservation-Quote-Created-Event" {
  topic_arn = "arn:aws:sns:us-east-1:123:MT-ReservationQuoteCreateqaent-QA.fifo"
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Command-AllEvents-QA.fifo"
  raw_message_delivery = true
}

resource "aws_sns_topic_subscription" "MT-Reservation-ParkingLot-Updated-Event" {
  topic_arn = "arn:aws:sns:us-east-1:123:MT-ReservationParkingLotUpdateqaent-QA.fifo"
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Command-AllEvents-QA.fifo"
  raw_message_delivery = true
}

resource "aws_sns_topic_subscription" "MT-Reservation-Deleted-Event" {
  topic_arn = "arn:aws:sns:us-east-1:123:MT-ReservationDeleteqaent-QA.fifo"
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Command-AllEvents-QA.fifo"
  raw_message_delivery = true
}

resource "aws_sns_topic_subscription" "MT-Reservation-Created-Event" {
  topic_arn = "arn:aws:sns:us-east-1:123:MT-ReservationCreateqaent-QA.fifo"
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Command-AllEvents-QA.fifo"
  raw_message_delivery = true
}

resource "aws_sns_topic_subscription" "MT-Reservation-CheckedOut-Event" {
  topic_arn = "arn:aws:sns:us-east-1:123:MT-ReservationCheckedOutEvent-QA.fifo"
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Command-AllEvents-QA.fifo"
  raw_message_delivery = true
}

resource "aws_sns_topic_subscription" "MT-Reservation-CheckIn-Event" {
  topic_arn = "arn:aws:sns:us-east-1:123:MT-ReservationCheckedInEvent-QA.fifo"
  protocol  = "sqs"
  endpoint  = "arn:aws:sqs:us-east-1:123:Task-Command-AllEvents-QA.fifo"
  raw_message_delivery = true
}
