Terraform Module: aws_essentials bootcamp - next gen
===========

- Repo exists to demonstrate the value of IaC during AWS Essentials Basecamps
- Purpose is to share with customers during workshop. 
- Module utilizes the primary terraform constructs - providers, variables, modules, resources and outputs
- This example uses Terraform best practices to split out terraform constructs - providers, variables, modules, resources and outputs into multiple files
- Deploys fundational environment (vpc, subnets, etc), 2 web servers (separate AZ's) and an elb.
- Web Servers have public IP addresses and are directly accessable via the internet so that students can SSH into them during the class.
- Custom (simple) web page deployed that displays the name of the web server
- Web servers running httpd and php

# Prerequisites
- Terraform installed and functional on local laptop
- Git installed and functional on local laptop
- Access to 2W Github repo to clone the code

# Preparation Ahead of Basecamp
- Copy code to local repo
- revise tfvars.terraform accordingly
- terraform init - initialize provider and modules
- terraform plan
- terraform apply
- Verify functionality - see outputs and test resources created
- terraform Destroy
- Congrats - you are ready for the basecamp

# Variables
- Assumes the AWS Access and Secret keys are configured locally as part of AWSCLI config.  If necessary you can provide them as variables in the terraform script (uugghh - don't do that!!)
- AWS Key Pair that resides in the AWS account. If there are no KeyPairs then create a keypair in the target account/region.  Remember to keep the private key one local machine so that you can login into the web servers
- US-EAST-1 is the default region, if you want to utilize a different region then update the script accordingly
- region, ami-id, vpc module, aws_region and several other variables can be easily modified


# Input Variables
- Default values set for all variables.  Update tfvars.terraform or use command line overrides as needed
- Assumes the AWS Access and Secret keys are configured locally as part of AWSCLI config.  If necessary you can provide them as variables in the terraform script (uugghh - don't do that!!)
- AWS Key Pair that resides in the AWS account. If there are no KeyPairs then create a keypair in the target account/region.  Remember to keep the private key one local machine so that you can login into the web servers
- US-EAST-1 is the default region, if you want to utilize a different region then update the script accordingly
- region, ami-id, vpc module, aws_region and several other variables can be easily modified

Usage
-----

```
TBD
```

Outputs
=======

- aws elb dns address
- web server IP addresses

Authors
=======

[Kevin Dillon](kdillon@2ndwatch.com)
