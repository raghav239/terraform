resource "google_compute_address" "static" {
    name = "ipv4-address"
}

data "google_compute_image" "ubuntu_image" {
  family = "ubuntu-2210-amd64"
  project = "ubuntu-os-cloud"
}

resource "google_compute_instance" "default" {
  name = "vm-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2210-kinetic-arm64-v20230125"
    }
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.static.address
    }

  }

}