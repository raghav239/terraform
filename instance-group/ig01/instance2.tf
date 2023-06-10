// Create - Instance -2

resource "google_compute_instance" "back-end-01" {
  name = "back-end-01"
  machine_type = "e2-medium"
  zone = "us-central1-a"

  tags = [ "db", "back-end" ]

  labels = {
    environment = "dev"
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-2204-jammy-v20230429"
      labels = {
        environment = "dev"
      }
    }
  }
  network_interface {
    network = google_compute_network.dev-nw-01.id
    subnetwork = google_compute_subnetwork.dev-sub-nw-01.id
    access_config {
      // Ephemeral public IP
    }
  }
  metadata = {
    environment = "dev"
  }

}