variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The region to deploy resources."
  type        = string
}

variable "zone" {
  description = "The zone to deploy resources."
  type        = string
}

variable "machine_type" {
  description = "Default machine type for VM"
  type        = string
}

variable "image" {
  description = "OS image for the VM boot disk"
  type        = string
}

variable "disk_size" {
  description = "Boot disk size in GB"
  type        = number
}

variable "vpc_name" {
  description = "Name of the custom VPC network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the custom subnet"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR range for the custom subnet"
  type        = string
}

variable "instance_labels" {
  description = "List of tags for the instance"
  type        = map(string)
}

variable "health_check_name" {
  description = "Name of the health check."
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
