# Uncommit it only when you're doing refresh from production DB snapshot. (Get latest snapshot from production DB)
# data "aws_db_snapshot" "db_snapshot" {
#   include_shared         = true
#   snapshot_type          = "shared" # Can be "public, shared, manual, awsbackup, automated"
#   db_snapshot_identifier = var.db_snapshot
# }