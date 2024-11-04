# Create SES Configuration Sets
resource "aws_ses_configuration_set" "this" {
  name = var.name
}

# Create Event Destination for SNS Topic
resource "aws_ses_event_destination" "this" {
  name                   = var.name
  configuration_set_name = var.name
  enabled                = true
  matching_types         = var.sns_event_type

  sns_destination {
    topic_arn = var.sns_topic_arn
  }
}