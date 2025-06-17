variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
}

variable "cluster_name" {
  description = "Cluster name"
  type        = string
}

variable "node_count" {
  default = "1"
}

variable "node_type" {
  default = "nvidia-l4"
}

variable "machine_type" {
  default = "g2-standard-4"
}

variable "disk_size_gb" {
  default = "100"
}

variable "name" {
  type        = string
  description = "(Optional) The full name of the GKE cluster node pool. If not defined, then 'cluster_name-pool_name' will be used instead."
  default     = null
}

variable "pool_name" {
  description = "The name of the GKE cluster node pool"
}

variable "service_account"{
  description = "The name of the GKE cluster service account"
}

variable "zones" {
  description = "List of GCP zones for GKE deployment"
  type        = list(string)
  default     = ["asia-southeast1-a"]
}

