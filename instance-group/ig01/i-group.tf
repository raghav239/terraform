// Instance-group

resource "google_compute_instance_group" "front-end-gp01" {
  name = "front-end-gp01"
  zone = "us-central1-a"
  network = google_compute_network.dev-nw-01.id

  instances = [
    google_compute_instance.front-end-01.id,
    google_compute_instance.back-end-01.id,
  ]

  named_port {
    name = "http"
    port = "80"
  }
  named_port {
    name = "https"
    port = "443"
  }
  named_port {
    name = "https"
    port = "8080"
  }
  lifecycle {
    create_before_destroy = true
  }
}