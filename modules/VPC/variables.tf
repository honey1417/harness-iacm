variable "vpc_name" {
  description = "Name of the custom VPC"
  type        = string
  default     = ""
}

variable "subnet_name" {
  description = "Name of the custom subnet"
  type        = string
  default     = ""
}

variable "subnet_cidr" {
  description = "CIDR range for the subnet"
  type        = string
  default     = ""
}

variable "region" {
  description = "Region for the subnet"
  type        = string
  default     = ""
}
