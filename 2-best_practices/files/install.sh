#!/bin/bash

# run updates and install httpd and php
sudo yum -y update
sudo yum install -y httpd php

# need elevated privileges to move tmp files to httpd html directory
#sudo mv /tmp/ec2_data.txt /usr/share/nginx/html/ec2_data.txt
sudo mv /tmp/index.php /var/www/html/index.php

#start httpd
sudo service httpd start

# Run httpd at boot
sudo chkconfig httpd on
