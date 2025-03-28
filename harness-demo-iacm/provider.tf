terraform {
  required_version = "~>1.5.7"
    required_providers {
      google = {
        source  = "hashicorp/google"
        version = "~>6.17.0"
      }
    }
    backend "gcs" {
      bucket = "harness-iacm-bucket"
      prefix = "terraform/state"
      
    }
    
  }
    
provider "google" {
  project     = var.PROJECT_ID
  region      = var.REGION
  zone        = var.zone
}
