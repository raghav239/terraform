// Network

resource "google_compute_network" "gws-scep-nw-01" {
  name = "gws-scep-nw-01"
  auto_create_subnetworks = false
  mtu = 1440
}

// Subnetwork

resource "google_compute_subnetwork" "public-snw-1" {
  name = "public-snw-1"
  network = google_compute_network.gws-scep-nw-01.id
  ip_cidr_range = "10.0.0.0/27"
  private_ip_google_access = true
  stack_type = "IPV4_ONLY"
}

// Fw- ingress

resource "google_compute_firewall" "Inbound-1" {
    name = "inbound-rule"
    direction = "INGRESS"
    network = google_compute_network.gws-scep-nw-01.id
    priority = 1

    allow {
      protocol = "tcp"
      ports = ["22","3389","80","443"]
    }

    allow {
      protocol = "icmp"
    }
    destination_ranges = ["10.0.0.0/27"]
    source_ranges = ["49.206.50.217"]
}

resource "google_compute_firewall" "Outbound-1" {
  name = "outbound-1"
  direction = "EGRESS"
  network = google_compute_network.gws-scep-nw-01.id
  priority = 1

  /*allow {
    protocol = "tcp"
    ports = [ "80","3389" ]
  }*/

  allow {
    protocol = "tcp"
    ports = [ "80","443" ]
  }
  source_ranges = [ "0.0.0.0/0" ]
}