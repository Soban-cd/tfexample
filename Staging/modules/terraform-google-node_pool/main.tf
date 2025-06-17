resource "google_container_node_pool" "default" {
  name                = var.name != null ? var.name : "${var.cluster_name}-${var.pool_name}"
  cluster             = var.cluster_name
  project             = var.project_id
  location            = var.region
  initial_node_count  = var.initial_node_count

  node_config {
    machine_type = var.machine_type
    disk_size_gb = var.disk_size_gb
    service_account = var.service_account
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  workload_metadata_config {
    mode = "GKE_METADATA"
  }
  }

  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }
}
