//Network
resource "google_compute_network" "dev-nw-01" {
  name = "dev-nw-01"
  mtu = 1400
  auto_create_subnetworks = false
}

//subnets
resource "google_compute_subnetwork" "dev-sub-nw-01" {
  network = google_compute_network.dev-nw-01.id
  name = "dev-sub-nw-01"
  ip_cidr_range = "10.0.0.0/27"
  private_ip_google_access = true
  stack_type = "IPV4_ONLY"

  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling = 0.5
    metadata = "INCLUDE_ALL_METADATA"
  }
}

//INGRESS - rule
resource "google_compute_firewall" "inbound-rules" {
  name = "inboud-rules"
  direction = "INGRESS"
  network = google_compute_network.dev-nw-01.id
  priority = 1

  allow {
    protocol = "tcp"
    ports = [ "22" ]
  }
  source_ranges = [ "0.0.0.0/0" ]
}

//EGRESS - rule
resource "google_compute_firewall" "outbound-rules" {
    network = google_compute_network.dev-nw-01.id
    name = "outbound-rules" 
    direction = "EGRESS"
    priority = 1

    allow {
      protocol = "tcp"
      ports = [ "22" ]
    }
    source_ranges = [ "0.0.0.0/0" ]
}