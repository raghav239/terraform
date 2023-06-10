terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "4.64.0"
    }
  }
}

provider "google" {
  project = "terraform-gcp-383907"
  credentials = "keys.json"
  region = "us-central1"
  zone = "us-central1-a"
}