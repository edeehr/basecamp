#!/bin/sh -x

#####
# Update Docker awslinux image
#   apply updates, 
#   install httpd and php
#   get customer web page to html directory
#   runhttpd  on startup.
#####

# Install updates
yum -y update

# Install apps
yum -y install httpd php

# Move customized (and simplistic) homepage to httpd directory
mv /tmp/index.php /var/www/html/index.php

