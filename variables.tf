variable "project_id" {
  description = "The GCP project ID."
  type        = string
}
variable "bucket_name" {
   description = "Backend Bucket Name to store Terraform State"
   type       = string
}
variable "region" {
  description = "The region to deploy resources."
  type        = string
}

variable "zone" {
  description = "The zone to deploy resources."
  type        = string
}


