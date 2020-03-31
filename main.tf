resource "google_compute_instance" "default" {
  name         = "${var.machine_type_gcloud8888}"
  machine_type = "n1-standard-2"
  zone         = "us-central1-a"
  allow_stopping_for_update = true

  tags = ["mytag555", "http-server", "web"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  network_interface {
    network = "${google_compute_network.vpc_network.id}"
    access_config {

    }
  }

  metadata_startup_script = "echo 'hostname -I' > /home/serg4kostiuk/test.txt"

}

resource "google_compute_network" "vpc_network" {
  name = "${var.network_gcloud8888}"
}

resource "google_compute_firewall" "default" {
  name    = "test-firewall-6767"
  network = "${google_compute_network.vpc_network.id}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "8080", "1000-2000"]
  }

  source_ranges = ["0.0.0.0/0"]
}
