terraform {
  required_providers {
    google = {
    source = "hashicorp/google"
    version = "4.63.1"
  }
}
}

provider "google" {
  project = "terraform-gcp-383907"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "keys.json"
}