#!/bin/sh -x

#####
# Create an AWS AMI, apply updates, install httpd and set httpd to run on startup.
#####

# Install updates
sudo yum -y update

# Install httpd and php
sudo yum -y install httpd php

# Move customized (and simplistic) homepage to httpd directory
sudo mv /tmp/index.php /var/www/html/index.php

# Run httpd at boot
sudo chkconfig httpd on
