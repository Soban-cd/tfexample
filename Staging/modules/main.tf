terraform {

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.11"
    }
  }
  required_version = ">= 1.3"
}



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
  remove_default_node_pool = false
  initial_node_count       = 1
  node_locations           = var.zones
  deletion_protection      = false

  /*private_cluster_config {
    enable_private_nodes    = false
    enable_private_endpoint = false # Only control plane is private
    //master_ipv4_cidr_block  = "172.16.0.0/28"
  }*/

  cost_management_config {
    enabled = true
  }
  
  control_plane_endpoints_config {
    dns_endpoint_config {
      allow_external_traffic = false  # Restricts external traffic to the control plane
    }
#    ip_endpoint_config {
#      enabled = false  # Disables direct IP access to the control plane
#    }
  }
  
  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 50
    service_account = data.google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}


resource "helm_release" "argocd" {
  name             = "argocd"
  namespace        = "argocd"
  create_namespace = true

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "7.8.8"

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }

  depends_on = [google_container_cluster.gke]
}

data "kubernetes_service" "argocd_server" {
  metadata {
    name      = "argocd-server"
    namespace = "argocd"
  }

  depends_on = [helm_release.argocd]
}