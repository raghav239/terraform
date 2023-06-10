

resource "google_compute_instance" "ubuntu-instance" {
  name = "instance-ubuntu"
  machine_type = "e2-medium"
  zone = "us-central1-a"

  tags = [ "instance", "ubuntu-container-engine" ]

  boot_disk {
    initialize_params {
      image = "ubuntu-2204-jammy-v20230429"
      labels = {
        "instance" = "container-engine"   
      }
    }
  }

  network_interface {
    network = google_compute_network.dev-nw-01.id
    subnetwork = google_compute_subnetwork.dev-sub-nw-01.id

    access_config {
      // ephermeral public IP
    }
  }

  metadata = {
    "instance" = "container-engine"
  }
}

resource "google_compute_project_metadata" "ssh-keys" {
  metadata = {
    ssh-keys = "praws0234:${file("/Users/raghupothula/Documents/terraform/container-engine/tfm-new-key.pub")}"
  }
}