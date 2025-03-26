terraform {
  backend "gcs" {
    bucket  = "harshini-project-452710-harness-iacm-bucket"
    prefix  = "terraform/statefiles/vpc-vm.state"
  }
}
