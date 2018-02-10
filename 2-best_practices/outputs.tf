#####
# Specify Outputs - this is a simple example, could combine with main.tf file
#####
output "elb_address" {
  value = "${aws_elb.web-elb.dns_name}"
}

output "web_server_address" {
  value = "${aws_instance.web_server.*.public_ip}"
}

