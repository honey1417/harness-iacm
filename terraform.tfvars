project_id = "harshini-project-452710"
region = "us-west3"
zone = "us-west3-c"
machine_type = "e2-medium"
image = "debian-cloud/debian-12"
disk_size = 10
network_name = "vpc-1-custom"
subnet_name  = "subnet-1-custom"
subnet_cidr = "10.0.0.0/24"
instance_labels = {
    vpc = "vpc-1-custom"
    subnet = "subnet-1-custom"
}