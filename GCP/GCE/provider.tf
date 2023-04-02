
terraform {
  required_providers {
    google  =   {
        source = "hashicorp/google"
        version =   "4.59.0"
    }
  }
}

provider "google" {
  project = "terraform-gcp-381809"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "keys.json"
}