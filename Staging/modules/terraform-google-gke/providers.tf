terraform {

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.11"
    }
  }
  required_version = ">= 1.3"
}

provider "google" {
  project = var.project_id
  region  = var.region
}

provider "kubernetes" {
  host  = "https://${google_container_cluster.gke.control_plane_endpoints_config[0].dns_endpoint_config[0].endpoint}"
  token = data.google_client_config.default.access_token
}
