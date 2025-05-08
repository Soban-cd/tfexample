provider "google" {
  project = var.project_id
  region  = var.region
  credentials = var.GOOGLE_CREDENTIALS
}


provider "kubernetes" {
  host  = "https://${google_container_cluster.gke.endpoint}"
  token = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(
    google_container_cluster.gke.master_auth[0].cluster_ca_certificate,
  )
}

provider "helm" {
    kubernetes {
    host  = "https://${google_container_cluster.gke.endpoint}"
    token = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(
      google_container_cluster.gke.master_auth[0].cluster_ca_certificate,
    )
  }
}