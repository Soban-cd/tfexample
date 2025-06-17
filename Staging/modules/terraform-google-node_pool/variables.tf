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

variable "initial_node_count" {
  default = "1"
}

variable "min_node_count" {
  default = "1"
}

variable "max_node_count" {
  default = "6"
}

variable "machine_type" {
  default = "e2-medium"
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


