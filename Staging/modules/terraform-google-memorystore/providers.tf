terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.39"
    }
  }
  required_version = ">= 1.3"
}
