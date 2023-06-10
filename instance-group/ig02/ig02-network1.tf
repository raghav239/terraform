// Network //
resource "google_compute_network" "dev-nw-01" {
  name = "dev-nw-01"
  auto_create_subnetworks = false
  mtu = 1440
}

resource "google_compute_subnetwork" "public" {
  name = "public-sub01"
  network = google_compute_network.dev-nw-01.id
  ip_cidr_range = "192.168.0.0/26"
  private_ip_google_access = true
  stack_type = "IPV4_ONLY"

  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling = 0.5
    metadata = "INCLUDE_ALL_METADATA"
  }
}

// Firewall rules 
// Ingress
resource "google_compute_firewall" "inbound" {
  name = "inbound-rule"
  direction = "INGRESS"
  network = google_compute_network.dev-nw-01.id
  priority = 1

  allow {
    protocol = "tcp"
    ports = [ "22" ]
  }
  source_ranges = [ "0.0.0.0/0" ]
}

// Egress

resource "google_compute_firewall" "outbound" {
  name = "outbound"
  direction = "EGRESS"
  network = google_compute_network.dev-nw-01.id
  priority = 1

  allow {
    protocol = "tcp"
    ports = ["22"]
  }

  source_ranges = [ "0.0.0.0/0" ]
}
