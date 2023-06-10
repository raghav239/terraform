// VPC

resource "google_compute_network" "dev-env-nw-01" {
  name = "dev-env-nw-01"
  auto_create_subnetworks = false
  mtu = 1440
}

resource "google_compute_subnetwork" "public-nw-01" {
  name = "public-nw-01"
  network = google_compute_network.dev-env-nw-01.id
  region = "us-central1"
  ip_cidr_range = "10.10.0.0/24"
  private_ip_google_access = true
  stack_type = "IPV4_ONLY"

  log_config {
    aggregation_interval = "INTERVAL_5_MIN"
    flow_sampling = 0.5
    metadata = "INCLUDE_ALL_METADATA"
  }
}


//Inbound
resource "google_compute_firewall" "Inbound-rules" {
  name = "inbound-rules"
  network = google_compute_network.dev-env-nw-01.id
  direction = "INGRESS"
  priority = 1

  source_ranges = ["0.0.0.0/0"]
  destination_ranges = [ "10.10.0.0/24" ]
 
  allow {
    protocol = "ICMP"
  }

  allow {
    protocol = "TCP"
    ports = [ "22","8080"]
  }
}

// Outbound 

resource "google_compute_firewall" "Outbound-rules" {
  name = "outbound-rules"
  network = google_compute_network.dev-env-nw-01.id
  direction = "EGRESS"
  priority = 1
  
    allow {
      protocol = "TCP"
      ports = [ "22" ]
    }
}