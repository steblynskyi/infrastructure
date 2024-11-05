# Craete SQS Queue Task-Initial-Notes-Import
resource "aws_sqs_queue" "Task-Initial-Notes-Import" {
  name                      = "Task-Initial-Notes-Import-QA"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 345600
  receive_wait_time_seconds = 0

  tags = {
    Environment = var.environment
    Terraform   = var.tag_terraform
  }
}


# Craete SQS InnSights-WebHookQueue
resource "aws_sqs_queue" "InnSights-WebHookQueue" {
  name                      = "InnSights-WebHookQueue-QA"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 345600
  receive_wait_time_seconds = 0

  tags = {
    Environment = var.environment
    Terraform   = var.tag_terraform
  }
}

resource "aws_sqs_queue_policy" "InnSights-WebHookQueue" {
  queue_url = aws_sqs_queue.InnSights-WebHookQueue.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "SQS:SendMessage",
      "Resource": "${aws_sqs_queue.InnSights-WebHookQueue.arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": [
            "${var.sns_topic_arn_WebHooksReservationCreated}",
            "${var.sns_topic_arn_WebHooksReservationUpdated}",
            "${var.sns_topic_arn_WebHooksGroupBlockCreate}",
            "${var.sns_topic_arn_WebHooksGroupBlockUpdate}",
            "${var.sns_topic_arn_WebHooksRoomMaintenanceCreate}",
            "${var.sns_topic_arn_WebHooksRoomMaintenanceUpdate}"
          ]
        }
      }
    }
  ]
}
POLICY

  depends_on = [aws_sqs_queue.InnSights-WebHookQueue]

}


# Craete SQS Queue Task-Reservation-Updated
resource "aws_sqs_queue" "Task-Reservation-Updated" {
  name                      = "Task-Reservation-Updated-QA"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 345600
  receive_wait_time_seconds = 0

  tags = {
    Environment = var.environment
    Terraform   = var.tag_terraform
  }
}

resource "aws_sqs_queue_policy" "Task-Reservation-Updated" {
  queue_url = aws_sqs_queue.Task-Reservation-Updated.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "SQS:SendMessage",
      "Resource": "${aws_sqs_queue.Task-Reservation-Updated.arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": [
            "${var.sns_topic_arn_WebHooksReservationUpdated}",
            "${var.sns_topic_arn_WebHooksReservationCreated}",
            "${var.sns_topic_arn_WebHooksReservationCheckedIn}",
            "${var.sns_topic_arn_WebHooksReservationCheckedOut}",
            "${var.sns_topic_arn_WebHooksReservationParkingLotUpdated}",
            "${var.sns_topic_arn_WebHooks-ReservationQuoteCreated}",
            "${var.sns_topic_arn_WebHooks-ReservationDeleted}"
          ]
        }
      }
    }
  ]
}
POLICY

  depends_on = [aws_sqs_queue.Task-Reservation-Updated]

}


# Craete SQS Queue WebHooks-RatePlanQueue
resource "aws_sqs_queue" "WebHooks-RatePlanQueue" {
  name                      = "WebHooks-RatePlanQueue-QA"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 345600
  receive_wait_time_seconds = 0

  tags = {
    Environment = var.environment
    Terraform   = var.tag_terraform
  }
}

resource "aws_sqs_queue_policy" "WebHooks-RatePlanQueue" {
  queue_url = aws_sqs_queue.WebHooks-RatePlanQueue.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "SQS:SendMessage",
      "Resource": "${aws_sqs_queue.WebHooks-RatePlanQueue.arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": [
            "${var.sns_topic_arn_WebHooks-RatePlanCreated}",
            "${var.sns_topic_arn_WebHooks-RatePlanUpdated}",
            "${var.sns_topic_arn_WebHooks-RatePlanDeleted}",
            "${var.sns_topic_arn_WebHooks-RatePlanOverride}",
            "${var.sns_topic_arn_WebHooks-ProductBundleCreated}",
            "${var.sns_topic_arn_WebHooks-ProductBundleUpdated}",
            "${var.sns_topic_arn_WebHooks-ProductBundleDeleted}",
            "${var.sns_topic_arn_WebHooks-RateOverride}",
            "${var.sns_topic_arn_WebHooks-RuleOverride}"
          ]
        }
      }
    }
  ]
}
POLICY

  depends_on = [aws_sqs_queue.WebHooks-RatePlanQueue]

}


# Craete SQS Queue WebHooks-ReservationsQueue
resource "aws_sqs_queue" "WebHooks-ReservationsQueue" {
  name                      = "WebHooks-ReservationsQueue-QA"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 345600
  receive_wait_time_seconds = 0

  tags = {
    Environment = var.environment
    Terraform   = var.tag_terraform
  }
}

resource "aws_sqs_queue_policy" "WebHooks-ReservationsQueue" {
  queue_url = aws_sqs_queue.WebHooks-ReservationsQueue.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "SQS:SendMessage",
      "Resource": "${aws_sqs_queue.WebHooks-ReservationsQueue.arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": [
            "${var.sns_topic_arn_WebHooksReservationCreated}"
          ]
        }
      }
    }
  ]
}
POLICY

  depends_on = [aws_sqs_queue.WebHooks-ReservationsQueue]

}


# Craete SQS Queue Folio-Background-Queue
resource "aws_sqs_queue" "Folio-Background-Queue" {
  name                      = "Folio-Background-Queue-QA"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 345600
  receive_wait_time_seconds = 0

  tags = {
    Environment = var.environment
    Terraform   = var.tag_terraform
  }
}

resource "aws_sqs_queue_policy" "Folio-Background-Queue" {
  queue_url = aws_sqs_queue.Folio-Background-Queue.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "SQS:SendMessage",
      "Resource": "${aws_sqs_queue.Folio-Background-Queue.arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": [
            "${var.sns_topic_arn_Create_Folio}"
          ]
        }
      }
    }
  ]
}
POLICY

  depends_on = [aws_sqs_queue.Folio-Background-Queue]

}


# Craete SQS Queue Reservation-Background-Queue
resource "aws_sqs_queue" "Reservation-Background-Queue" {
  name                      = "Reservation-Background-Queue-QA"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 345600
  receive_wait_time_seconds = 0

  tags = {
    Environment = var.environment
    Terraform   = var.tag_terraform
  }
}

resource "aws_sqs_queue_policy" "Reservation-Background-Queue" {
  queue_url = aws_sqs_queue.Reservation-Background-Queue.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "SQS:SendMessage",
      "Resource": "${aws_sqs_queue.Reservation-Background-Queue.arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": [
            "${var.sns_topic_arn_Reservation_Status_Update}"
          ]
        }
      }
    }
  ]
}
POLICY

  depends_on = [aws_sqs_queue.Reservation-Background-Queue]

}


# SQS Queue Task-Command-AllEvents-QA.fifo
resource "aws_sqs_queue" "Task-Command-AllEvents-Queue" {
  name                      = "Task-Command-AllEvents-QA.fifo"
  fifo_queue                = true
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 345600
  receive_wait_time_seconds = 0

  tags = {
    Environment = var.environment
    Terraform   = var.tag_terraform
  }
}

resource "aws_sqs_queue_policy" "Task-Command-AllEvents-Queue" {
  queue_url = aws_sqs_queue.Task-Command-AllEvents-Queue.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "SQS:SendMessage",
      "Resource": "${aws_sqs_queue.Task-Command-AllEvents-Queue.arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": [
            "${var.sns_topic_arn_MT_ReservationUpdatedEvent}",
            "${var.sns_topic_arn_MT_ReservationQuoteCreatedEvent}",
            "${var.sns_topic_arn_MT_ReservationParkingLotUpdatedEvent}",
            "${var.sns_topic_arn_MT_ReservationDeletedEvent}",
            "${var.sns_topic_arn_MT_ReservationCreatedEvent}",
            "${var.sns_topic_arn_MT_ReservationCheckedOutEvent}",
            "${var.sns_topic_arn_MT_ReservationCheckedInEvent}"
          ]
        }
      }
    }
  ]
}
POLICY

  depends_on = [aws_sqs_queue.Task-Command-AllEvents-Queue]

}


# Craete SQS Queue Integrations-Email-API-Queue
resource "aws_sqs_queue" "Integrations-Email-API-SesDeliveryNotifications" {
  name                      = "Integrations-Email-API-SesDeliveryNotifications-QA"
  delay_seconds             = 0
  max_message_size          = 262144
  message_retention_seconds = 345600
  receive_wait_time_seconds = 0

  tags = {
    Environment = var.environment
    Terraform   = var.tag_terraform
  }
}


resource "aws_sqs_queue_policy" "Integrations-Email-API-SesDeliveryNotifications" {
  queue_url = aws_sqs_queue.Integrations-Email-API-SesDeliveryNotifications.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "SQS:SendMessage",
      "Resource": "${aws_sqs_queue.Integrations-Email-API-SesDeliveryNotifications.arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": [
            "${var.sns_topic_arn_Integrations-Email-API-SesDeliveryNotifications}"
          ]
        }
      }
    }
  ]
}
POLICY

  depends_on = [aws_sqs_queue.Integrations-Email-API-SesDeliveryNotifications]

}