provider "google" {
  credentials = "${file("account.json")}"
  project = "decoded-path-356013"
  region  = var.region
  zone    = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-net"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terra-jenk"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}

