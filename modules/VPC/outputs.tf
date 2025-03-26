output "vpc_id" {
  description = "The ID of the custom VPC."
  value       = google_compute_network.custom_vpc.self_link
}

output "subnet_id" {
  description = "The ID of the custom subnet."
  value       = google_compute_subnetwork.custom_subnet.self_link
}


