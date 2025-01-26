# main.tf

provider "google" {
  credentials = file("<path-to-your-service-account-json-file>")
  project     = "<your-gcp-project-id>"
  region      = "us-central1" 
}

# GCP Bucket Resource
resource "google_storage_bucket" "my_bucket" {
  name          = "my-unique-bucket-name"  
  location      = "US"
  force_destroy = true
}

# BigQuery Dataset Resource
resource "google_bigquery_dataset" "my_dataset" {
  dataset_id = "my_dataset"  
  project    = ""
  location   = "US"  # 
}
