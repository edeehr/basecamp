# 
#####
# main.tf
#   Single module idntifying terraform constructs (providers, variables, modules, resources and outputs.
#   Single file makes it easier to review code during basecamps/workshops with customers.
#####
#
# to do
# 
# setup .git ignore and terraform ignore  
# customized index.html page
#
#####
# Single provider, keeping it simple
#####
provider "aws" {
  region = "us-east-1"
}

# setup custom index file for web servers
data "template_file" "index" {
  count    = "2"
  template = "${file("files/index.php.tpl")}"

  vars {
    hostname = "web-${format("%03d", count.index + 1)}"
  }
}


#####
# Use 2nd Watch VPC module. No need to reinvent the wheel
#####
module "vpc-us-east-1" {
  source               = "git::ssh://git@github.com/2ndWatch/tfm_aws_vpc.git?ref=1.1.1"
  aws_region           = "us-east-1"
  name                 = "${var.environment_tag}"
  cidr                 = "${var.vpc_cidr}"
  availability_zones   = ["us-east-1a", "us-east-1b"]
  private_subnets      = "${var.public_subnet_cidr}"
  public_subnets       = "${var.private_subnet_cidr}"
  nat_gateway          = false
  flow_logs            = false
  enable_dns_hostnames = true
  enable_dns_support   = true
  s3_endpoint          = false
  name_prefix          = "${var.environment_tag}-"
  tags {
    environment = "${var.environment_tag}"
  }
}

#####
# allow ssh and http inbound from anywhere to web servers
#####
resource "aws_security_group" "ssh_and_http_inbound_sg" {
  name                 = "ssh_and_http_inbound"
  description          = "Allow SSH and HTTP from Anywhere"
  vpc_id               = "${module.vpc-us-east-1.vpc_id}"
  tags {
    environment = "${var.environment_tag}"
  }

  ingress {
    from_port          = 22
    to_port            = 22
    protocol           = "tcp"
    cidr_blocks        = ["0.0.0.0/0"]
  }  

  ingress {
    from_port          = 80
    to_port            = 80
    protocol           = "tcp"
    cidr_blocks        = ["0.0.0.0/0"]
  }   

  egress {
    from_port          = 0
    to_port            = 0
    protocol           = "-1"
    cidr_blocks        =["0.0.0.0/0"]
  }
}

resource "aws_security_group" "http_inbound_sg" {
  name                 = "http_inbound"
  description          = "Allow HTTP from Anywhere"
  vpc_id               = "${module.vpc-us-east-1.vpc_id}"
  tags {
    environment = "${var.environment_tag}"
  }

  ingress {
    from_port          = 80
    to_port            = 80
    protocol           = "tcp"
    cidr_blocks        = ["0.0.0.0/0"]
  }   

  egress {
    from_port          = 0
    to_port            = 0
    protocol           = "-1"
    cidr_blocks        =["0.0.0.0/0"]
  }
}

#####
# web server instances - use count to set fleet of arbitray size
#####
resource "aws_instance" "web_server" {
  ami                         = "${var.web_server_instance_ami}"
  instance_type               = "${var.web_server_instance_type}"
  key_name                    = "${var.instance_key_pair}"
# update to use both subnets
  subnet_id                   = "${module.vpc-us-east-1.public_subnets[0]}"
  associate_public_ip_address = true
  security_groups             =["${aws_security_group.ssh_and_http_inbound_sg.id}"]
  user_data                   = "${file("files/install.sh")}"
  # use count function to uniquely identify each web server
  tags  {
    Name = "web_server-${format("%03d", count.index + 1)}"
    environment = "${var.environment_tag}"
  }
  # specify the number of web servers to create, 2 is enough for demo purposes
  count = "2"
  # specify provisioner connection string
  connection {
    user        = "ec2-user"
    private_key = "${file(var.private_key_location)}"
  }

  # place index.html file in tmp directory as sudo is required in install.sh to move to final destination
  provisioner "file" {
    content     = "${element(data.template_file.index.*.rendered, count.index)}"
    destination = "/tmp/index.php"
  }

}

#####
# elastic load balancer and use elb specific security group
#####
resource "aws_elb" "web-elb" {
  name                        = "web-elb"
  subnets                     = ["${module.vpc-us-east-1.public_subnets}"]
  security_groups             = ["${aws_security_group.http_inbound_sg.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }  

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 2
    target              = "TCP:80"
    interval            = 5
  }

  # add all web instances to elb using splat notation
  instances = ["${aws_instance.web_server.*.id}"]

}
