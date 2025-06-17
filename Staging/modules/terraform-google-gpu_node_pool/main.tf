resource "google_container_node_pool" "default" {
  name               = var.name != null ? var.name : "${var.cluster_name}-${var.pool_name}"
  cluster            = var.cluster_name
  project            = var.project_id
  location           = var.region
  initial_node_count = 1
  node_locations     = var.zones

  node_config {
    machine_type = var.machine_type
    disk_size_gb = var.disk_size_gb
    service_account = var.service_account
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/devstorage.read_only"
    ]

    guest_accelerator {
      type  = var.node_type
      count = var.node_count
      gpu_driver_installation_config {
        gpu_driver_version = "DEFAULT"
      }
    }

    #labels = {
    #  "gke-no-default-nvidia-gpu-device-plugin" = "true"
    #}
  }


}
