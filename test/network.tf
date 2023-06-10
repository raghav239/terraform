// vpc

resource "google_compute_network" "network21-e" {
  name = "network21-e"
  mtu = 1440
  auto_create_subnetworks = false
}