variable "credentials" {
  description = "My credentials"
default     = "./keys/creds.json"
}

variable "region" {
  description = "Project Region"
  default     = "us-central1"

}

variable "project" {
  description = "project"
  default     = "third-apex-454116-v1"

}

variable "location" {
  description = "Location"
  default     = "US"

}

variable "bq_dataset_name" {
  description = "My big Query Dataset Name"
  default     = "demo_dataset"

}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  default     = "third-apex-454116-v1-terra-bucket"
}


variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}