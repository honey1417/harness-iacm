output "instance_id" {
  description = "The ID of the compute instance."
  value       = google_compute_instance.harshini-vm.id
}

output "instance_name" {
  description = "The name of the compute instance."
  value       = google_compute_instance.harshini-vm.name
}

output "instance_internal_ip" {
  description = "The internal network IP of the instance."
  value       = google_compute_instance.harshini-vm.network_interface[0].network_ip
}

output "instance_external_ip" {
  description = "The external IP address of the instance."
  value       = google_compute_instance.harshini-vm.network_interface[0].access_config[0].nat_ip
}
