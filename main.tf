provider "google" {
  project = var.project_id
  region  = var.region
}

# Optionally, call your VPC module if you want to create a custom VPC.
module "VPC" {
  source      = "./modules/VPC"
  vpc_name    = var.vpc_name
  subnet_name = var.subnet_name
  subnet_cidr = var.subnet_cidr
  region      = var.region
}

module "LoadBalancing" {
  source = "./modules/LoadBalancing"
  region = var.region
  zone   = var.zone

  instance_template_name = "centos-instance-template"
  machine_type           = var.machine_type
  source_image           = var.image
  
  # Pass network info from the VPC module outputs or directly supply the network value.
  network    = module.VPC.vpc_id        # Make sure VPC module outputs "vpc_id"
  subnetwork = module.VPC.subnet_id     # Make sure VPC module outputs "subnet_id"
  
  health_check_name       = var.health_check_name
  health_check_interval   = 20
  health_check_timeout    = 15
  healthy_threshold       = 1
  unhealthy_threshold     = 3
  health_check_port       = 80
  health_check_path       = "/index.html"
  
  mig_name                = var.mig_name
  instance_base_name      = var.instance_base_name
  mig_target_size         = 2
  named_port              = 80
  auto_healing_delay      = 300
  
  backend_service_name    = "gcp-backend-service"
  url_map_name            = "gcp-url-map"
  http_proxy_name         = "gcp-http-proxy"
  forwarding_rule_name    = "gcp-forwarding-rule"
  forwarding_rule_port    = "80"
  firewall_rule_name      = "allow-http-firewall"
  firewall_target_tag     = "http-server"
}




