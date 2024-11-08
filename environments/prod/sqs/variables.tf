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
  default     = "PROD"
}

variable "tag_terraform" {
  description = "Terraform set a tag to true"
  default     = "True"
}

variable "sns_topic_arn_WebHooksReservationCreated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ReservationCreated-PROD"
}

variable "sns_topic_arn_WebHooksReservationUpdated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ReservationUpdated-PROD"
}

variable "sns_topic_arn_WebHooksReservationDeleted" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ReservationDeleted-PROD"
}


variable "sns_topic_arn_WebHooksGroupBlockCreate" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-GroupBlockCreate-PROD"
}

variable "sns_topic_arn_WebHooksGroupBlockUpdate" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-GroupBlockUpdate-PROD"
}

variable "sns_topic_arn_WebHooksRoomMaintenanceCreate" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-RoomMaintenanceCreate-PROD"
}

variable "sns_topic_arn_WebHooksRoomMaintenanceUpdate" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-RoomMaintenanceUpdate-PROD"
}

variable "sns_topic_arn_WebHooksReservationCheckedIn" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ReservationCheckedIn-PROD"
}

variable "sns_topic_arn_WebHooksReservationCheckedOut" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ReservationCheckedOut-PROD"
}

variable "sns_topic_arn_WebHooksReservationParkingLotUpdated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ReservationParkingLotUpdated-PROD"
}

variable "sns_topic_arn_WebHooks-ReservationQuoteCreated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ReservationQuoteCreated-PROD"
}

variable "sns_topic_arn_WebHooks-FolioCreated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-FolioCreated-PROD"
}

variable "sns_topic_arn_WebHooks-FolioUpdated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-FolioUpdated-PROD"
}

variable "sns_topic_arn_WebHooks-GroupPickUp" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-GroupPickUp-PROD"
}

variable "sns_topic_arn_WebHooks-RatePlanCreated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-RatePlanCreated-PROD"
}

variable "sns_topic_arn_WebHooks-RatePlanUpdated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-RatePlanUpdated-PROD"
}

variable "sns_topic_arn_WebHooks-RatePlanDeleted" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-RatePlanDeleted-PROD"
}

variable "sns_topic_arn_WebHooks-PropertyCreated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-PropertyCreated-PROD"
}

variable "sns_topic_arn_WebHooks-PropertyUpdated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-PropertyUpdated-PROD"
}

variable "sns_topic_arn_WebHooks-RatePlanOverride" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-RatePlanOverride-PROD"
}

variable "sns_topic_arn_WebHooks-ProductBundleCreated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ProductBundleCreated-PROD"
}

variable "sns_topic_arn_WebHooks-ProductBundleUpdated" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ProductBundleUpdated-PROD"
}

variable "sns_topic_arn_WebHooks-ProductBundleDeleted" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-ProductBundleDeleted-PROD"
}

variable "sns_topic_arn_WebHooks-RuleOverride" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-RuleOverride-PROD"
}

variable "sns_topic_arn_WebHooks-RateOverride" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:WebHooks-RateOverride-PROD"
}

variable "sns_topic_arn_Create_Folio" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:Create-Folio-PROD"
}

variable "sns_topic_arn_Reservation_Status_Update" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:Reservation-Status-Update-PROD"
}


variable "sns_topic_arn_MT_ReservationUpdatedEvent" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:MT-ReservationUpdatedEvent-PROD.fifo"
}

variable "sns_topic_arn_MT_ReservationQuoteCreatedEvent" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:MT-ReservationQuoteCreatedEvent-PROD.fifo"
}

variable "sns_topic_arn_MT_ReservationParkingLotUpdatedEvent" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:MT-ReservationParkingLotUpdatedEvent-PROD.fifo"
}

variable "sns_topic_arn_MT_ReservationDeletedEvent" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:MT-ReservationDeletedEvent-PROD.fifo"
}

variable "sns_topic_arn_MT_ReservationCreatedEvent" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:MT-ReservationCreatedEvent-PROD.fifo"
}

variable "sns_topic_arn_MT_ReservationCheckedOutEvent" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:MT-ReservationCheckedOutEvent-PROD.fifo"
}

variable "sns_topic_arn_MT_ReservationCheckedInEvent" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:MT-ReservationCheckedInEvent-PROD.fifo"
}

variable "sns_topic_arn_Integrations-Email-API-SesDeliveryNotifications" {
  description = "ARN of SNS to allow access"
  default     = "arn:aws:sns:us-east-1:123:Integrations-Email-API-SesDeliveryNotifications-PROD"
}