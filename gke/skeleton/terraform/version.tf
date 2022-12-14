terraform {
  required_version = ">= 1.3.0"

  backend "gcs" {
    bucket = ${{values.gcloudProject | dump}}
    prefix = "gke/terraform/state"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
    }
  }
}