# Instance Template

resource "google_compute_instance_template" "module_template" {
  name         = var.instance_template_name
  machine_type = var.machine_type
  region       = var.region

  disk {
    source_image = var.source_image
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network       = var.network
    subnetwork    = var.subnetwork
    access_config {}  
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    sudo yum update -y 
    sudo yum install httpd -y 
    sudo systemctl start httpd
    sudo systemctl enable httpd
    sudo systemctl status httpd
    echo "<h1>Hello World from $(hostname -f)</h1>" | sudo tee /var/www/html/index.html
    EOT
}



# Health Check for the LB

resource "google_compute_health_check" "http_health_check" {
  name                = var.health_check_name
  check_interval_sec  = var.health_check_interval
  timeout_sec         = var.health_check_timeout
  healthy_threshold   = var.healthy_threshold
  unhealthy_threshold = var.unhealthy_threshold

  http_health_check {
    port         = var.health_check_port
    request_path = var.health_check_path
  }
}



# Managed Instance Group (MIG) using the instance template.

resource "google_compute_instance_group_manager" "module_mig" {
  name               = var.mig_name
  base_instance_name = var.instance_base_name
  zone               = var.zone
  target_size        = var.mig_target_size

  version {
    instance_template = google_compute_instance_template.module_template.id
  }

  named_port {
    name = "http"
    port = var.named_port
  }

  auto_healing_policies {
    health_check      = google_compute_health_check.http_health_check.id
    initial_delay_sec = var.auto_healing_delay
  }
}



# Backend Service for Load Balancing

resource "google_compute_backend_service" "backend_service" {
  name                  = var.backend_service_name
  load_balancing_scheme = "EXTERNAL"
  health_checks         = [google_compute_health_check.http_health_check.self_link]

  backend {
    group = google_compute_instance_group_manager.module_mig.instance_group
  }
}



# URL Map for the Load Balancer

resource "google_compute_url_map" "url_map" {
  name            = var.url_map_name
  default_service = google_compute_backend_service.backend_service.self_link
}



# HTTP Proxy for the Load Balancer

resource "google_compute_target_http_proxy" "http_proxy" {
  name    = var.http_proxy_name
  url_map = google_compute_url_map.url_map.self_link
}



# Global Forwarding Rule for HTTP Traffic

resource "google_compute_global_forwarding_rule" "http_forwarding_rule" {
  name       = var.forwarding_rule_name
  target     = google_compute_target_http_proxy.http_proxy.self_link
  port_range = var.forwarding_rule_port
}



# Firewall Rule to Allow HTTP Traffic

resource "google_compute_firewall" "http_firewall" {
  name    = var.firewall_rule_name
  network = var.network

  allow {
    protocol = "tcp"
    ports    = ["80","22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = [var.firewall_target_tag]
}
