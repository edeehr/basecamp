#!/bin/sh -x

#####
# Create an AWS AMI, apply updates, install httpd and set httpd to run on startup.
#####

# Install updates
sudo yum update -y

# Install httpd
sudo yum -y install httpd

# Move customized (and simplistic) homepage to httpd directory
sudo mv /tmp/index.html /var/www/html/index.html

# Run httpd at boot
sudo chkconfig httpd on
