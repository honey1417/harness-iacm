resource "google_compute_instance" "harness-vm" {
  name         = "harness-vm"
  machine_type = var.machine_type
  zone         = var.zone
  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = "default"
    access_config {
      # This gives the VM an external IP
    }
  }
}
