

data "google_client_config" "default" {
}

data "google_service_account" "default" {
  account_id = "terraform-deploy"
}

resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  network       = google_compute_network.vpc.id
  ip_cidr_range = var.subnet_cidr
  region        = var.region
}

resource "google_container_cluster" "gke" {
  name                     = var.cluster_name
  location                 = var.region
  network                  = google_compute_network.vpc.name
  subnetwork               = google_compute_subnetwork.subnet.name
  remove_default_node_pool = true
  initial_node_count       = 1
  node_locations           = var.zones
  deletion_protection      = false

  resource_labels = {
    env        = "staging"
    managed_by = "devops"
    app        = "remove_default_node_pool"
  }

  private_cluster_config {
    enable_private_nodes    = var.enable_private_nodes
    enable_private_endpoint = var.enable_private_endpoint # Only control plane is private
  }

  master_authorized_networks_config {
    dynamic "cidr_blocks" {
      for_each = var.authorized_networks
      content {
        cidr_block   = cidr_blocks.key
        display_name = cidr_blocks.value
      }
    }
  }

  cost_management_config {
    enabled = var.enable_cost_allocation
  }
  
  control_plane_endpoints_config {
    dns_endpoint_config {
      allow_external_traffic = var.enabled_dns_endpoint  # Restricts external traffic to the control plane
    }
  }

  maintenance_policy {
    recurring_window {
      start_time = "2025-05-14T20:00:00Z"
      end_time = "2025-05-15T00:00:00Z"
      recurrence = "FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR"
    }
  }

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }
}


