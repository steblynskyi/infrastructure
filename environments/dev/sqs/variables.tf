variable "region" {
  description = "Which region envirment will be created"
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS Profile name on local machine for multi aws account use"
  default     = "taras"
}

variable "environment" {
  description = "Environment name"
  default     = "DEV"
}

variable "tag_terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

variable "sns_topic_arn_WebHooksReservationCreated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ReservationCreated-DEV"
}

variable "sns_topic_arn_WebHooksReservationUpdated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ReservationUpdated-DEV"
}

variable "sns_topic_arn_WebHooksGroupBlockCreate" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-GroupBlockCreate-DEV"
}

variable "sns_topic_arn_WebHooksGroupBlockUpdate" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-GroupBlockUpdate-DEV"
}

variable "sns_topic_arn_WebHooksRoomMaintenanceCreate" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-RoomMaintenanceCreate-DEV"
}

variable "sns_topic_arn_WebHooksRoomMaintenanceUpdate" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-RoomMaintenanceUpdate-DEV"
}

variable "sns_topic_arn_WebHooksReservationCheckedIn" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ReservationCheckedIn-DEV"
}

variable "sns_topic_arn_WebHooksReservationCheckedOut" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ReservationCheckedOut-DEV"
}

variable "sns_topic_arn_WebHooksReservationParkingLotUpdated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ReservationParkingLotUpdated-DEV"
}

variable "sns_topic_arn_WebHooks-ReservationQuoteCreated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ReservationQuoteCreated-DEV"
}

variable "sns_topic_arn_WebHooks-FolioCreated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-FolioCreated-DEV"
}

variable "sns_topic_arn_WebHooks-FolioUpdated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-FolioUpdated-DEV"
}

variable "sns_topic_arn_WebHooks-GroupPickUp" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-GroupPickUp-DEV"
}

variable "sns_topic_arn_WebHooks-ReservationDeleted" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ReservationDeleted-DEV"
}

variable "sns_topic_arn_WebHooks-RatePlanCreated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-RatePlanCreated-DEV"
}

variable "sns_topic_arn_WebHooks-RatePlanUpdated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-RatePlanUpdated-DEV"
}

variable "sns_topic_arn_WebHooks-RatePlanDeleted" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-RatePlanDeleted-DEV"
}

variable "sns_topic_arn_WebHooks-RatePlanOverride" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-RatePlanOverride-DEV"
}

variable "sns_topic_arn_WebHooks-ProductBundleCreated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ProductBundleCreated-DEV"
}

variable "sns_topic_arn_WebHooks-ProductBundleUpdated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ProductBundleUpdated-DEV"
}

variable "sns_topic_arn_WebHooks-ProductBundleDeleted" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ProductBundleDeleted-DEV"
}

variable "sns_topic_arn_WebHooks-RateOverride" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-RateOverride-DEV"
}

variable "sns_topic_arn_WebHooks-RuleOverride" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-RuleOverride-DEV"
}

variable "sns_topic_arn_Create_Folio" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:Create-Folio-DEV"
}

variable "sns_topic_arn_Reservation_Status_Update" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:Reservation-Status-Update-DEV"
}

variable "sns_topic_arn_MT_ReservationUpdatedEvent_DEV" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:MT-ReservationUpdatedEvent-DEV.fifo"
}

variable "sns_topic_arn_MT_ReservationQuoteCreatedEvent_DEV" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:MT-ReservationQuoteCreatedEvent-DEV.fifo"
}

variable "sns_topic_arn_MT_ReservationParkingLotUpdatedEvent_DEV" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:MT-ReservationParkingLotUpdatedEvent-DEV.fifo"
}

variable "sns_topic_arn_MT_ReservationDeletedEvent_DEV" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:MT-ReservationDeletedEvent-DEV.fifo"
}

variable "sns_topic_arn_MT_ReservationCreatedEvent_DEV" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:MT-ReservationCreatedEvent-DEV.fifo"
}

variable "sns_topic_arn_MT_ReservationCheckedOutEvent_DEV" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:MT-ReservationCheckedOutEvent-DEV.fifo"
}

variable "sns_topic_arn_MT_ReservationCheckedInEvent_DEV" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:MT-ReservationCheckedInEvent-DEV.fifo"
}

variable "sns_topic_arn_Integrations-Email-API-SesDeliveryNotifications" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:Integrations-Email-API-SesDeliveryNotifications-DEV"
}