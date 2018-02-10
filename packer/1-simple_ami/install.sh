#!/bin/sh -x

#####
# Create an AWS AMI, apply updates, install nginx and set nginx to run on startup.
#####

# Install updates
sudo yum update -y

# Install nginx
sudo yum -y install nginx

# Move customized (and simplistic) homepage to nginx directory
sudo mv /tmp/index.html /usr/share/nginx/html/index.html

# Run nginx at boot
sudo chkconfig nginx on
