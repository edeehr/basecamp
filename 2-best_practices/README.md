Terraform Module: sa_aws_essentials_bootcamp
===========
##### A Terraform module for AWS that builds environments for AWS Essentials Bootcamps

Repo Purpose:
------
- Demonstrate the value of IaC during AWS Essentials Basecamps and for ad-hoc customer demonstrations
- Easily shared and explained to customers 
- Demonstrate the primary terraform constructs - providers, variables, modules, resources and outputs
- This particular example illustrates using multiple modules to split out terraform constructs - providers, variables, modules, resources and outputs into multiple files
- Deploys fundational environment (vpc, subnets, etc), 2 web servers (separate AZ's) and an elb.
- Web Servers have public IP addresses and are directly accessable via the internet support SSH into them during the class.
- Web servers running httpd and php
- Custom (simple) web page deployed that displays the name of the web server

The following components are built:
------
- Single-Region (default is us-east-1)
- 1 VPC/2 Public and 2 Private Subnets (not used)
- Internet Gateway and Routing tables
- 2 Web Server instances with custom home pages.
- 1 Classic ELB
- 2 Security Groups - ELB and Web Server

# Prerequisites
- Terraform installed and functional on local laptop
- Git installed and functional on local laptop
- Access to 2W Github repo to clone the code

# Preparation Ahead of Basecamp
- configure awsclie to utilize appropriate access/secret keys
- Copy code to local repo
- revise tfvars.terraform accordingly (see below) - at least customize the event_description variable
- terraform init - initialize provide, modules and data files
- terraform plan
- terraform apply
- Verify functionality - review outputs and test resources created
- terraform destroy
- Congrats!! - you are ready for the basecamp

# Variables
- Assumes the AWS Access and Secret keys are configured locally as part of AWSCLI config.  Do not put the keys into the terraform modules - practice sound security principles and reinforce this throughout the basecamp.
- AWS KeyPair in the target account. If there are no KeyPairs then create a keypair in the target account/region.  Remember to keep the private key one local machine so that you can login into the web servers
- US-EAST-1 is the default region, if you want to utilize a different region then update the script accordingly
- region, ami-id, vpc module, aws_region and several other variables can be easily modified

# Input Variables
- Default values set for all variables.  Update tfvars.terraform or use command line overrides as needed
- Assumes the AWS Access and Secret keys are configured locally as part of AWSCLI config.  If necessary you can provide them as variables in the terraform script (uugghh - don't do that!!)
- AWS Key Pair that resides in the AWS account. If there are no KeyPairs then create a keypair in the target account/region.  Remember to keep the private key one local machine so that you can login into the web servers
- US-EAST-1 is the default region, if you want to utilize a different region then update the script accordingly
- region, ami-id, vpc module, aws_region and several other variables can be easily modified


### Terraform Outputs
----------------------
| Output | Purpose |
|:-------- |:--------|
event_description | This text will be displayed in the custom web pages
elb dns name | Full elb dns name so participants can test
web server ip address | Allow participants to test individual web servers and ssh to insta


### Terraform Templates
----------------------
| Template | Purpose |
|:-------- |:--------|
main.tf | All resource creation
outputs.tf | Show variable and resource values
terraform.tfvars | Creates & configures the RDS MySQL instances
variables.tf | Creates & configures the RDS MySQL instances
vpcs.tf | Creates the VPC (https://github.com/2ndWatch/tfm_aws_vpc.git?ref=1.1.1)

### Environment Input Variables - interface.tf
----------------------

| Variable | Prerod Default | Prod Default |
|:-------- |:-------------|:----------------|
environment | preprod | prod
zone_id | Z3RJSNZFTLOFUY | ZN4M6EMUTNTD7
domain | fdo-qa.myvzw.com | fdo.myvzw.com

### Instance Detail Variables - interface.tf
----------------------
| Variable | Prod Default | Preprod Default |
|:-------- |:-------------|:----------------|
instance_type | m4.large | m4.large
rds_instance_type | db.m4.large | db.m4.large
build_asg_size | min 1, max 1 | min 1, max 1
gateway_asg_size | min 2, max 2 | min 2, max 2
auth_asg_size | min 2, max 2 | min 2, max 2
dashboard_asg_size | min 2, max 2 | min 2, max 2
dr_build_asg_size | min 1, max 1 | min 1, max 1
dr_gateway_asg_size | min 1, max 1 | min 1, max 1
dr_auth_asg_size | min 1, max 1 | min 1, max 1
dr_dashboard_asg_size | min 1, max 1 | min 1, max 1

#### Routing
-----

```
To alter routing between the two regions, change the 'weighted_routing_policy' block in route53-records.tf
Default values: us-east-1 = 100, us-west-2 = 0
```

Authors
=======

[Kevin Dillon](kdillon@2ndwatch.com)
