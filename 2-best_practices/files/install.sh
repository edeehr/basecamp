#!/bin/bash
sudo yum -y update
sudo yum install -y httpd php
sudo service httpd start

# get pubic-hostname ami-id from EC2 metadata and put into text file
# that will be referenced by index.html.  using echo to add new line 
#curl http://169.254.169.254/latest/meta-data/public-hostname >> /tmp/ec2_data.txt
#echo >> /tmp/ec2_data.txt
#curl http://169.254.169.254/latest/meta-data/instance-id >> /tmp/ec2_data.txt
#echo >> /tmp/ec2_data.txt
#curl http://169.254.169.254/latest/meta-data/security-groups >> /tmp/ec2_data.txt

# need elevated privileges to move tmp files to httpd html directory
#sudo mv /tmp/ec2_data.txt /usr/share/nginx/html/ec2_data.txt
sudo mv /tmp/index.php /var/www/html/index.php

# Run httpd at boot
sudo chkconfig httpd on
