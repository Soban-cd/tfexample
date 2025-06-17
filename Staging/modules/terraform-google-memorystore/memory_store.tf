resource "google_memorystore_instance" "instance" {
  instance_id             = var.instance_id
  project                 = var.project_id
  location                = var.region
  shard_count             = var.shard_count
  authorization_mode      = "IAM_AUTH"
  transit_encryption_mode = "SERVER_AUTHENTICATION"
  mode                    = var.mode
  node_type               = var.node_type

  dynamic "desired_psc_auto_connections" {
    for_each = var.network_ids
    iterator = network_id
    content {
      network    = network_id.value
      project_id = var.project_id
    }
  }

  persistence_config {
    mode = "AOF"
    aof_config {
      append_fsync = "EVERY_SEC"
    }
  }

  deletion_protection_enabled = true
}
