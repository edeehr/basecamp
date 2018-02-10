#####
# Setup variables as a separate file in keeping with best practices. 
# Values for variables specified in terraform.tfvars - yeah a little overkill
####

variable "environment_tag" {
  type = "string"
  description = "environment tag"
}

variable "vpc_cidr" {
  type = "string"
  description = "vpc cidr block"
}

variable "public_subnet_cidr" {
  type = "list"
  description = "public subnet cidr block"
}

variable "private_subnet_cidr" {
  type = "list"
  description = "public subnet cidr block"
}

variable "web_server_instance_ami" {
  type = "string"
  description = "ami id for web server"
}

variable "web_server_instance_type" {
  type = "string"
  description = "Web Server Instance Type"
}

variable "instance_key_pair" {
  type = "string"
  description = "Instance Key Pair"
}

variable "private_key_location" {
  type = "string"
  description = "private key with path"
}

variable "event_description" {
  type = "string"
  description = "event description to insert into index.php template page"
}