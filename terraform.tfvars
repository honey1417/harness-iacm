project_id = "harshini-project-452710"
region = "us-east1"
zone = "us-east1-b"
machine_type = "e2-medium"
image = "centos-cloud/centos-stream-9"
disk_size = 20
vpc_name = "vpc-1-custom"
subnet_name  = "subnet-1-custom"
subnet_cidr = "10.0.0.0/24"
instance_labels = {
    vpc = "vpc-1-custom"
    subnet = "subnet-1-custom"
    load_balancing = "yes"
}
health_check_name   = "http-health-check"
mig_name            = "harness-gcp-mig"
instance_base_name  = "harness-gcp-instance"