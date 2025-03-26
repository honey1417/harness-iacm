output "instance_template_id" {
  description = "The ID of the instance template."
  value       = google_compute_instance_template.module_template.id
}

output "mig_instance_group" {
  description = "The instance group URL from the MIG."
  value       = google_compute_instance_group_manager.module_mig.instance_group
}

output "backend_service_self_link" {
  description = "The self link of the backend service."
  value       = google_compute_backend_service.backend_service.self_link
}

output "global_forwarding_rule_ip" {
  description = "The external IP address of the load balancer."
  value       = google_compute_global_forwarding_rule.http_forwarding_rule.ip_address
}
