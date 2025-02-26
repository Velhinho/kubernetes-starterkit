
# Elemets of the cloud such as virtual servers,
# networks, firewall rules are created as resources

resource "google_compute_firewall" "frontend_rules" {
  name    = "frontend"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["80", "443", "9100", "9090"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["http123"]
}
