#####
# specify variable values
#####
environment_tag = "2w_aws_essentials_demo"

vpc_cidr = "10.0.0.0/16"

public_subnet_cidr = ["10.0.0.0/24", "10.0.1.0/24"]

private_subnet_cidr = ["10.0.2.0/24", "10.0.3.0/24"]

web_server_instance_ami = "ami-97785bed"

web_server_instance_type = "t2.micro"

instance_key_pair = "id_rsa"

private_key_location = "/Users/kdillon/.ssh/id_rsa"

event_description = "Basecamp Demo"


/*
region = "us-east-1"

ami = {
  us-east-1 = "ami-f652979b"
  us-west-1 = "ami-7c4b331c"
}

*/