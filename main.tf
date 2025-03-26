provider "google" {
  project = var.project_id
  region  = var.region
}

module "GCE" {
  source        = "./modules/GCE"
  instance_name = "harness-iacm-instance"
  machine_type  = "e2-medium"
  zone          = var.zone
  image         = "debian-cloud/debian-12"
  disk_size     = 15
  network       = "default"
}
