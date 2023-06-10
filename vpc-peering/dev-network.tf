// vpc

resource "google_compute_network" "dev-nw-01" {
  name = "dev-nw-01"
  auto_create_subnetworks = false
  mtu = 1440
}

resource "google_compute_subnetwork" "dev-sub-nw-01" {
  name = "dev-sub-nw-01"
  network = google_compute_network.dev-nw-01.id
  ip_cidr_range = "192.168.0.0/29"
  stack_type = "IPV4_ONLY"  
  }
/*
resource "google_compute_subnetwork" "dev-sub-nw-02" {
  name = "dev-sub-nw-02"
  network = google_compute_network.dev-nw-01.id
  ip_cidr_range = "10.0.0.0/29"
  stack_type = "IPV4_ONLY"  
  }
*/

//inbound-rules

resource "google_compute_firewall" "Inbound-rule-01" {
  name = "inbound-rule-01"
  network = google_compute_network.dev-nw-01.id
  direction = "INGRESS"
  priority = 1

  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "TCP"
    ports = ["22"]    
  }

  allow {
    protocol = "ICMP"
  }
}


//outbound

resource "google_compute_firewall" "Outbound-01" {
    name = "outbound-rule-01"
    network = google_compute_network.dev-nw-01.id
    direction = "EGRESS"
    priority = 1

    source_ranges = ["0.0.0.0/0"]

    allow {
      protocol = "ICMP" 
     }

    allow {
      protocol = "TCP"
      ports = ["1-65535"]
    }
}