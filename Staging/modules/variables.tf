variable "project_id" {
  description = "GCP Project ID"
  type        = string
}
/*variable "gcp_credentials" {
  type = string
}*/

variable "region" {
  description = "GCP Region"
  type        = string
}

variable "zones" {
  description = "List of GCP zones for GKE deployment"
  type        = list(string)
  default     = ["asia-southeast1-a"]
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
}

variable "subnet_name" {
  description = "Subnet Name"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
}

variable "cluster_name" {
  description = "Kubernetes Cluster Name"
  type        = string
}

variable "master_ipv4_cidr_block" {
  description = "CIDR block for Kubernetes Master"
  type        = string
}

