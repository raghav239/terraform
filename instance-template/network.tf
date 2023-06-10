
//VPC

resource "google_compute_network" "dev-nw-01" {
  name = "dev-nw-01"
  auto_create_subnetworks = false
  mtu = 1400
}

//SUBNETWORK
resource "google_compute_subnetwork" "dev-sub-nw-01" {
    name = "public"
    ip_cidr_range = "10.0.0.0/27"
    private_ip_google_access =  true
    network = google_compute_network.dev-nw-01.id
    stack_type = "IPV4_ONLY"

    log_config {
      aggregation_interval = "INTERVAL_10_MIN"
      flow_sampling = 0.5
      metadata = "INCLUDE_ALL_METADATA"
    }
}

// INGRESS
resource "google_compute_firewall" "ingress-rule" {
  name = "ingress-rule-01"
  direction = "INGRESS"
  network = google_compute_network.dev-nw-01.id

  allow {
    protocol = "TCP"
    ports = ["22"]
  }
  source_ranges = [ "0.0.0.0/0" ]
}

// EGRESS
resource "google_compute_firewall" "egress-rule" {
  name = "egress-rule-01"
  direction = "EGRESS"
  network = google_compute_network.dev-nw-01.id

  allow {
    protocol = "TCP"
    ports = ["1-2000"]
  }
  source_ranges = [ "0.0.0.0/0" ]
}