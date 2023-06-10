//instance

resource "google_compute_instance" "scep-srv01" {
  name = "scep-srv-01"
  machine_type = "e2-medium"
  zone = "us-central1-a"

  tags = ["web","scep-machine"]

  labels = {
    "environment" = "gws-scep-srv"
  }

  boot_disk {
    initialize_params {
      image = "windows-server-2016-dc-v20230510"
      labels = {
        "environment" = "gws-scep-srv"
      }
    }
  }

  network_interface {
    network = google_compute_network.gws-scep-nw-01.id
    subnetwork =  google_compute_subnetwork.public-snw-1.id

    access_config {
      // Ephemeral public IP
    }
  }
  metadata = {
    "ssh-keys" = "praws0234:${file("/Users/raghupothula/Documents/terraform/scep-srv/tfm-new-key.pub")}"
  }
}