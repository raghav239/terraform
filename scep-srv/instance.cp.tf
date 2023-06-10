//instance
/*
resource "google_compute_instance" "test-machine-1" {
  name = "test-machine-1"
  machine_type = "e2-medium"
  zone = "us-central1-a"

  tags = ["test","test-machine"]

  labels = {
    "environment" = "gws-test-machine"
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-2204-jammy-v20230429"
      labels = {
        "environment" = "gws-test-machine"
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
    "ssh-keys" = "praws0234:${file("/home/raghu/devops/terraform/scep-srv/tfm-new-key.pub")}"
  }
} */
