resource "google_compute_instance" "harshini-vm" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
    access_config {} # This allocates a one-to-one NAT IP to the instance.
  }
  labels = var.labels
}
