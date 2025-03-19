terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.25.0"
    }
  }
}

provider "google" {
  # Configuration options\
  
  project = "third-apex-454116-v1"
  region  = "us-central1"
}

resource "google_storage_bucket" "demo-bucket" {
  name          = "third-apex-454116-v1-terra-bucket"
  location      = "US"
  force_destroy = true

  # lifecycle_rule {
  #   condition {
  #     age = 3
  #   }
  #   action {
  #     type = "Delete"
  #   }
  # }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}