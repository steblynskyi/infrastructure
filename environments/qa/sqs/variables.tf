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
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ReservationCreated-QA"
}

variable "sns_topic_arn_WebHooksReservationUpdated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ReservationUpdated-QA"
}

variable "sns_topic_arn_WebHooksGroupBlockCreate" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-GroupBlockCreate-QA"
}

variable "sns_topic_arn_WebHooksGroupBlockUpdate" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-GroupBlockUpdate-QA"
}

variable "sns_topic_arn_WebHooksRoomMaintenanceCreate" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-RoomMaintenanceCreate-QA"
}

variable "sns_topic_arn_WebHooksRoomMaintenanceUpdate" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-RoomMaintenanceUpdate-QA"
}

variable "sns_topic_arn_WebHooksReservationCheckedIn" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ReservationCheckedIn-QA"
}

variable "sns_topic_arn_WebHooksReservationCheckedOut" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ReservationCheckedOut-QA"
}

variable "sns_topic_arn_WebHooksReservationParkingLotUpdated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ReservationParkingLotUpdated-QA"
}

variable "sns_topic_arn_WebHooks-ReservationQuoteCreated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ReservationQuoteCreated-QA"
}

variable "sns_topic_arn_WebHooks-FolioCreated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-FolioCreated-QA"
}

variable "sns_topic_arn_WebHooks-FolioUpdated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-FolioUpdated-QA"
}

variable "sns_topic_arn_WebHooks-GroupPickUp" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-GroupPickUp-QA"
}

variable "sns_topic_arn_WebHooks-ReservationDeleted" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ReservationDeleted-QA"
}

variable "sns_topic_arn_WebHooks-RatePlanCreated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-RatePlanCreated-QA"
}

variable "sns_topic_arn_WebHooks-RatePlanUpdated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-RatePlanUpdated-QA"
}

variable "sns_topic_arn_WebHooks-RatePlanDeleted" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-RatePlanDeleted-QA"
}

variable "sns_topic_arn_WebHooks-RatePlanOverride" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-RatePlanOverride-QA"
}

variable "sns_topic_arn_WebHooks-ProductBundleCreated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ProductBundleCreated-QA"
}

variable "sns_topic_arn_WebHooks-ProductBundleUpdated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ProductBundleUpdated-QA"
}

variable "sns_topic_arn_WebHooks-ProductBundleDeleted" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ProductBundleDeleted-QA"
}

variable "sns_topic_arn_WebHooks-RateOverride" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-RateOverride-QA"
}

variable "sns_topic_arn_WebHooks-RuleOverride" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-RuleOverride-QA"
}

variable "sns_topic_arn_Create_Folio" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:Create-Folio-QA"
}

variable "sns_topic_arn_Reservation_Status_Update" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:Reservation-Status-Update-QA"
}

variable "sns_topic_arn_MT_ReservationUpdatedEvent" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:MT-ReservationUpdatedEvent-QA.fifo"
}

variable "sns_topic_arn_MT_ReservationQuoteCreatedEvent" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:MT-ReservationQuoteCreatedEvent-QA.fifo"
}

variable "sns_topic_arn_MT_ReservationParkingLotUpdatedEvent" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:MT-ReservationParkingLotUpdatedEvent-QA.fifo"
}

variable "sns_topic_arn_MT_ReservationDeletedEvent" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:MT-ReservationDeletedEvent-QA.fifo"
}

variable "sns_topic_arn_MT_ReservationCreatedEvent" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:MT-ReservationCreatedEvent-QA.fifo"
}

variable "sns_topic_arn_MT_ReservationCheckedOutEvent" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:MT-ReservationCheckedOutEvent-QA.fifo"
}

variable "sns_topic_arn_MT_ReservationCheckedInEvent" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:MT-ReservationCheckedInEvent-QA.fifo"
}

variable "sns_topic_arn_Integrations-Email-API-SesDeliveryNotifications" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:Integrations-Email-API-SesDeliveryNotifications-QA"
}