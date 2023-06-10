// Network //

resource "google_compute_network" "dev-nw-01" {
  name = "dev-nw-01"
  mtu = 1440
  auto_create_subnetworks = false
}

// sub-network //

resource "google_compute_subnetwork" "dev-sub-nw-01" {
  name = "dev-sub-nw-01"
  network = google_compute_network.dev-nw-01.id
  ip_cidr_range = "10.0.0.0/25"
  private_ip_google_access = true
  stack_type = "IPV4_ONLY"
}

// Firewall rule - Ingress//

resource "google_compute_firewall" "inbound" {
  name = "inbound"
  direction = "INGRESS"
  network = google_compute_network.dev-nw-01.id
  source_ranges = [ "0.0.0.0/0" ]
  
  allow {
    protocol = "tcp"
    ports = ["22"]
  }
}

// Firewall rule - Outbound //

resource "google_compute_firewall" "outbound" {
  name = "outbound"
  direction = "EGRESS"
  network = google_compute_network.dev-nw-01.id
  source_ranges = [ "0.0.0.0/0" ]

  allow {
    protocol = "tcp"
    ports = ["22"]
  }

}

