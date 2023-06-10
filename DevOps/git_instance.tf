resource "google_compute_instance" "name" {
  name = "git-inc"
  machine_type = "e2-medium"
  zone = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-2204-jammy-v20230429"
    }
  }

  network_interface {
    network = google_compute_network.dev-env-nw-01.id
    subnetwork = google_compute_subnetwork.public-nw-01.id
    
    access_config {
      
    }
  }
}