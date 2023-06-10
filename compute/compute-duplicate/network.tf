
// vpc

resource "google_compute_network" "dev-nw-01" {
  name = "dev-nw-01"
  auto_create_subnetworks = false
  mtu = 1430
}

// subnets

resource "google_compute_subnetwork" "dev-snw-01" {
  name = "public"
  network = google_compute_network.dev-nw-01.id
  ip_cidr_range = "10.0.0.0/28"
  private_ip_google_access = false
  stack_type = "IPV4_ONLY"
  region = "us-central1"
}

// firewall- inbound

resource "google_compute_firewall" "inbound" {
  name = "inbooud"
  direction = "INGRESS"
  network = google_compute_network.dev-nw-01.id

  allow {
    protocol = "TCP"
    ports = ["22"]
  }
  source_ranges = [ "0.0.0.0/0" ]
}

// firewall- inbound

resource "google_compute_firewall" "outbound" {
  name = "outbooud"
  direction = "EGRESS"
  network = google_compute_network.dev-nw-01.id

  allow {
    protocol = "TCP"
    ports = ["1-65535"]
  }
  source_ranges = ["0.0.0.0/0"]
}