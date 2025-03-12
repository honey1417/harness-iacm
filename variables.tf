variable "PROJECT_ID" {
    description = "Project ID"
    type = string
    //default = "harshini-project-452710"
}
variable "REGION" {
    description = "Region for resources"
    type = string
  //default = "us-east1"
}
variable "zone" {
    description = "Zone of the VM"
    type = string
    //default = "us-east1-a"
}
variable "machine_type" {
    description = "Machine type of the VM"
    type = string
    //default = "n1-standard-1"
}
variable "image" {
    description = "Image of the VM"
    type = string
    //default = "centos-cloud/centos-stream-9-v20250123"
}
