variable "instance_template_name" {
  description = "Name of the instance template."
  type        = string
}

variable "machine_type" {
  description = "Machine type for the instances."
  type        = string
}

variable "region" {
  description = "Region for the instance template and LB."
  type        = string
}

variable "zone" {
  description = "Zone for the MIG."
  type        = string
}

variable "source_image" {
  description = "Source image for the instance template."
  type        = string
}

variable "network" {
  description = "The network to attach the instance template to."
  type        = string
}

variable "subnetwork" {
  description = "The subnetwork for the instance template."
  type        = string
}

variable "health_check_name" {
  description = "Name of the health check."
  type        = string
}

variable "health_check_interval" {
  description = "Interval between health check probes in seconds."
  type        = number
}

variable "health_check_timeout" {
  description = "Timeout for the health check in seconds."
  type        = number
}

variable "healthy_threshold" {
  description = "Healthy threshold for health check."
  type        = number
}

variable "unhealthy_threshold" {
  description = "Unhealthy threshold for health check."
  type        = number
}

variable "health_check_port" {
  description = "Port for the health check."
  type        = number
}

variable "health_check_path" {
  description = "Request path for the health check."
  type        = string
}

variable "mig_name" {
  description = "Name of the managed instance group."
  type        = string
}

variable "instance_base_name" {
  description = "Base name for instances in the MIG."
  type        = string
}

variable "mig_target_size" {
  description = "Target size for the MIG (number of instances)."
  type        = number
}

variable "named_port" {
  description = "Named port for the instance group."
  type        = number
}

variable "auto_healing_delay" {
  description = "Auto healing initial delay in seconds."
  type        = number
}

variable "backend_service_name" {
  description = "Name of the backend service."
  type        = string
}

variable "url_map_name" {
  description = "Name of the URL map."
  type        = string
}

variable "http_proxy_name" {
  description = "Name of the target HTTP proxy."
  type        = string
}

variable "forwarding_rule_name" {
  description = "Name of the global forwarding rule."
  type        = string
}

variable "forwarding_rule_port" {
  description = "Port range for the global forwarding rule."
  type        = string
}

variable "firewall_rule_name" {
  description = "Name of the firewall rule."
  type        = string
}

variable "firewall_target_tag" {
  description = "Target tag for the firewall rule."
  type        = string
}
