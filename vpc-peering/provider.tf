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

resource "google_compute_project_metadata" "ssh-keys" {
  metadata = {
    ssh-keys = "praws0234:${file("/Users/raghupothula/Documents/terraform/vpc-peering/tfm-new-key.pub")}"
  }
}