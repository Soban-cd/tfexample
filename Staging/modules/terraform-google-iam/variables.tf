variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "name" {
  description = "SA name"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "asia-southeast1"
}

variable "description" {
  description = "SA description"
  type        = string
}

variable "gke_workload_identity_sa" {
  description = "[PROJECT_ID].svc.id.goog[[KYS_NAMESPACE]/[KSA_NAME]]"
  type        = set(string)
  default     = []
}