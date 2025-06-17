output "service_account" {
  value = data.google_service_account.default.email
}

output "project_id" {
  value = var.project_id
}

output "cluster_id" {
  description = "GKE Cluster ID"
  value       = google_container_cluster.gke.id
}

output "network_id" {
  description = "VPC network ID"
  value       = google_compute_network.vpc.id
}

output "network_name" {
  description = "VPC Network Name"
  value       = google_compute_network.vpc.name
}

output "subnet_name" {
  description = "Subnet Name"
  value       = google_compute_subnetwork.subnet.name
}

output "subnet_id" {
  description = "Subnet ID"
  value       = google_compute_subnetwork.subnet.id
}

output "zones" {
  description = "Subnet Zones"
  value       = var.zones
}

output "cluster_endpoint" {
  description = "GKE Cluster API Endpoint"
  value       = google_container_cluster.gke.endpoint
}

output "cluster_name" {
  value = var.cluster_name
}

output "gke_dns_endpoint" {
  value = google_container_cluster.gke.control_plane_endpoints_config[0].dns_endpoint_config[0].endpoint
}

output "access_token" {
  value = data.google_client_config.default.access_token
}
