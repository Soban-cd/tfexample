module "gke_staging" {
  source                = "../modules"
  project_id            = "dazzling-mantra-459111-n8"
  region                = "asia-southeast1"
  zones                 = ["asia-southeast1-a"]
  vpc_name              = "staging-vpc"
  subnet_name           = "staging-subnet"
  subnet_cidr           = "10.0.1.0/24"
  cluster_name          = "pp-stg-1"
  master_ipv4_cidr_block = "192.168.1.0/28"
}


resource "google_container_node_pool" "medium" {
  name       = "medium"
  cluster    = module.gke_staging.cluster_id
  project    = module.gke_staging.project_id
  node_count = 2

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 30
    service_account = module.gke_staging.service_account
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}

/* resource "google_container_node_pool" "l4" {
  name       = "l4"
  cluster    = module.gke_staging.cluster_id
  project    = module.gke_staging.project_id
  node_count = 1

  node_config {
    machine_type = "g2-standard-4"
    disk_size_gb = 100
    service_account = module.gke_staging.service_account
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/devstorage.read_only"
    ]

    guest_accelerator {
      type  = "nvidia-l4"
      count = 1
      gpu_driver_installation_config {
        gpu_driver_version = "INSTALLATION_DISABLED"
      }
    }

    labels = {
      "gke-no-default-nvidia-gpu-device-plugin" = "true"
    }
  }
} */