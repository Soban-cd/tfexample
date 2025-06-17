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
