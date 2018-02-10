Terraform Module: aws_essentials bootcamp
===========

- Repo exists to demonstrate the value of IaC during AWS Essentials Basecamps
- Using a single file to simplify code review during basecamps/workshops
- Module utilizes the primary terraform constructs - providers, variables, modules, resources and outputs
- Deploys fundational environment (vpc, subnets, etc), 2 web servers (separate AZ's) and an elb.  
- Web Servers have public IP addresses and are directly accessable via the internet so that students can SSH into them during the class.

# Prerequisites
- Terraform installed and functional on local laptop
- Git installed and functional on local laptop
- Access to 2W GitHub Repos

# Preparation Ahead of Basecamp
- Copy code to local repo
- Configure variables (see below)
- terraform init - initialize provider and modules
- terraform plan
- terraform apply
- Verify functionality - view web page, ssh to web servers
- terraform destroy
- Congrats!! -- you are ready for the basecamp

# Variables
- Assumes the AWS Access and Secret keys are configured locally as part of AWSCLI config.  If necessary you can provide them as variables in the terraform script (uugghh - don't do that!!)
- AWS Key Pair that resides in the AWS account. If there are no KeyPairs then create a keypair in the target account/region.  Remember to keep the private key one local machine so that you can login into the web servers
- US-EAST-1 is the default region, if you want to utilize a different region then update the script accordingly
- region, ami-id, vpc module, aws_region and several other variables can be easily modified


Input Variables
----------------------
(defaults in parentheses)

- demo script - all variables are defined in main.tf module for simplicity

Usage
-----

```
TBD
```

Outputs
=======

aws elb dns address
web server 1 IP address
web server 2 IP address

ToDo
=======

create diagram for environment


Authors
=======

[Kevin Dillon](kdillon@2ndwatch.com)
