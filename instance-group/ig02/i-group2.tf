resource "google_compute_instance_group" "staging-group" {
  name = "staging-instance-group"
  zone = "us-central1-a"
  instances = [google_compute_instance.staging-vm.id]

  named_port {
    name = "https"
    port = "8443"
  }

  named_port {
    name = "http"
    port = "8080"
  }

  lifecycle {
    create_before_destroy = true
  }
}

data "google_compute_image" "os-image" {
  family = "ubuntu-2204-lts-arm64"
  project = "ubuntu-os-cloud"
}

resource "google_compute_instance" "staging-vm" {
  name = "staging-vm"
  machine_type = "e2-medium"
  zone = "us-central1-a"
  boot_disk {
    initialize_params {
      image = data.google_compute_image.os-image.id
    }
  }
  network_interface {
    network = google_compute_network.dev-nw-01.id
    subnetwork = google_compute_subnetwork.public.id
  }
}

resource "google_compute_backend_service" "staging-service" {
  name = "staging-service"
  port_name = "https"
  protocol = "HTTPS"

  backend {
    group = google_compute_instance_group.staging-group.id
  }

  health_checks = [
    google_compute_https_health_check.staging-health.id
  ]
}

resource "google_compute_https_health_check" "staging-health" {
  name = "staging-health"
  request_path = "/health_check"
}

