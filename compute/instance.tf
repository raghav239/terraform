resource "google_compute_instance" "ubuntu01" {
  name = "ubuntu01"
  machine_type = "e2-medium"
  zone = "us-central1-a"


  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "ubuntu-2204-jammy-v20230429"
      labels = {
        my_label = "value"
      }
    }
  }
/*
  scratch_disk {
    interface = "SCSI"
  } */

  network_interface {
    network = google_compute_network.dev-nw01.id
    subnetwork = google_compute_subnetwork.public.id

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }
}

resource "google_compute_project_metadata" "metadata-1" {
  metadata = {
    ssh-keys = "praws0234:${file("/Users/raghupothula/Documents/terraform/compute/tfm-new-key.pub")}"
  }
}