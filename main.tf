
resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
  }

  metadata = {
    foo = "bar"
  }

}

resource "google_compute_network" "vpc_network" {
  name = "vpc-network"
}
