#!/bin/sh -x

#####
# Create an AWS AMI, apply updates, install nginx and set nginx to run on startup.
#####

# Install updates
sudo yum -y update

# Install nginx
sudo yum -y install httpd php

# Move customized (and simplistic) homepage to nginx directory
sudo mv /tmp/index.php /var/www/html/index.php

# Run nginx at boot
sudo chkconfig httpd on
