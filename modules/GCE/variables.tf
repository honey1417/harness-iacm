variable "instance_name" {
  description = "Name of the compute instance."
  type        = string
  default     = ""
}

variable "machine_type" {
  description = "The machine type to create."
  type        = string
  default     = ""
}
variable "zone" {
  description = "The GCP zone where the instance will be created."
  type        = string
}
variable "image" {
  description = "The image to use for the boot disk."
  type        = string
  default     = ""
}

variable "disk_size" {
  description = "Size of the boot disk in GB."
  type        = number
  default     = null
}

variable "network" {
  description = "The network to attach the instance to."
  type        = string
  default     = ""
}

variable "subnetwork" {
   description = "The subnetwork to attach the instance to."
  type        = string
  default     = ""
}

variable "labels" {
  description = "List of tags to apply to the instance"
  type        = map(string)
  default     = {}
}