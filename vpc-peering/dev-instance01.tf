
resource "google_compute_instance" "dev-instance-01" {
    name = "dev-instance-01"
    machine_type = "e2-medium"
    zone = "us-central1-a"

    tags = ["instance" , "instance"]

    boot_disk {
      initialize_params {
        image = "ubuntu-2204-jammy-v20230429"
        labels = {
            my_label = "dev-instance-01"
        }
      }
    }

    network_interface {
      network = google_compute_network.dev-nw-01.id
      subnetwork = google_compute_subnetwork.dev-sub-nw-01.id
    
    access_config {
    }
    }
}
