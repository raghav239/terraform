
//instance

resource "google_compute_instance" "ad-srv-01" {
  name = "ad-srv-01"
  machine_type = "e2-medium"
  zone = "us-central1-a"

  tags = ["ad","scep-machine"]

  labels = {
    "environment" = "gws-ad-srv"
  }

  boot_disk {
    initialize_params {
      image = "windows-server-2016-dc-v20230510"
      labels = {
        "environment" = "gws-ad-srv"
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
