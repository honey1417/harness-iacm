provider "google" {
  project = var.project_id
  region  = var.region
}

module "VPC" {
  source       = "./modules/VPC"
  vpc_name     = var.vpc_name
  subnet_name  = var.subnet_name
  subnet_cidr  = var.subnet_cidr
  region       = var.region
}


module "GCE" {
  source        = "./modules/GCE"
  instance_name = "harness-vpc-instance"
  machine_type  = var.machine_type
  zone          = var.zone
  image         = var.image
  disk_size     = var.disk_size
  network       = module.VPC.vpc_id
  subnetwork    = module.VPC.subnet_id
  labels        = var.instance_labels
}

