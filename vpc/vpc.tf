
// Network //

resource "google_compute_network" "dev-nw01" {
     name = "dev-new01"
     auto_create_subnetworks = false
     mtu = 1450
     
}

//Subnetwork//

resource "google_compute_subnetwork" "public" {
     name = "public"
     ip_cidr_range = "10.10.0.0/27"
     private_ip_google_access = false
     region = "us-central1"
     network = google_compute_network.dev-nw01.id
     stack_type = "IPV4_ONLY"
     
     log_config {
       aggregation_interval = "INTERVAL_10_MIN"
       flow_sampling = 0.5
       metadata = "INCLUDE_ALL_METADATA"
     }
}

// Firewall policy  - Egress//

resource "google_compute_firewall" "Egress" {
  network = google_compute_network.dev-nw01.id
  name = "outbound"
  direction = "EGRESS"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports = ["80", "8080", "1000-2000"]
  }
  source_ranges = ["0.0.0.0/0"]
}

// Firewall policy  - INGRESS //

resource "google_compute_firewall" "firewall2" {
  network = google_compute_network.dev-nw01.id
  name = "inbound"
  direction = "INGRESS"

  deny {
    protocol = "tcp"
    ports = ["2001-4000"]
  }

  source_ranges = ["0.0.0.0/0"]
}