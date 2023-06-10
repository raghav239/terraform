// resource

resource "google_compute_instance" "ubuntu" {
  name = "ubuntu-instance"
  machine_type = "e2-medium"
  zone = "us-central1-a"

  tags = ["dev","front-end"]

  boot_disk {
    initialize_params {
      image = "ubuntu-2204-jammy-v20230429"
      size = 30
      labels = {
        my_label = "ubuntu-machine"
      }
    }
  }

  network_interface {
    network = google_compute_network.dev-nw-01.id
    subnetwork = google_compute_subnetwork.dev-snw-01.id

    access_config {
      // ephemeral public IP
    }
  }

  metadata = {
    dev = "front-end"
  }
}

resource "google_compute_project_metadata" "add-ssh-keys" {
  metadata = {
    ssh-keys = "praws0234:${file("/Users/raghupothula/Documents/terraform/compute/tfm-new-key.pub")}"
  }
}
