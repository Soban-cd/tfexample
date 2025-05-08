output "service_account" {
  value       = data.google_service_account.default.email
}

output "project_id" {
  value       = var.project_id
}

output "cluster_id" {
  description = "GKE Cluster ID"
  value       = google_container_cluster.gke.id
}

output "network_name" {
  description = "VPC Network Name"
  value       = google_compute_network.vpc.name
}

output "subnet_name" {
  description = "Subnet Name"
  value       = google_compute_subnetwork.subnet.name
}

output "zones" {
  description = "Subnet Zones"
  value       = var.zones
}

output "cluster_endpoint" {
  description = "GKE Cluster API Endpoint"
  value       = google_container_cluster.gke.endpoint
}

output "argocd_server_ip" {
  value = data.kubernetes_service.argocd_server.status[0].load_balancer[0].ingress[0].ip
}