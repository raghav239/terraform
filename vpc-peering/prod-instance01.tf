resource "google_compute_instance" "prod-instance" {
    name = "prod-instance"
    machine_type = "e2-medium"
    zone = "us-central1-a"

    tags = [ "instance" , "prod-instance" ]

    boot_disk {
      initialize_params {
        image = "ubuntu-2204-jammy-v20230429"
      }
    }

    network_interface {
      network = google_compute_network.prod-nw-01.id
      subnetwork = google_compute_subnetwork.prod-sub-nw-01.id

      access_config {
        
      }
    }
}