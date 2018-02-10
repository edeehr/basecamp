Terraform Module: 1-single-file
===========

- Repo exists to demonstrate the value of IaC during AWS Essentials Basecamps
- Using a single file to simplify code review during basecamps/workshops
- Module utilizes the primary terraform constructs - providers, variables, modules, resources and outputs
- Deploys fundational environment (vpc, subnets, etc), 2 web servers (separate AZ's) and an elb.  
- Web Servers have public IP addresses and are directly accessable via the internet so that students can SSH into them during the class.

### The following components are built:
------
- Single Region (default is us-east-1)
- 1 VPC/2 Public and 2 Private Subnets (not used)
- Internet Gateway and Routing tables
- 2 Web Server instances with custom home pages.
- 1 Classic ELB
- 2 Security Groups - ELB and Web Server

### Prerequisites
------
- Terraform installed and functional on local laptop
- Git installed and functional on local laptop
- Access to 2W Github repo to clone the code

### Preparation Ahead of Basecamp
------
- configure awsclie to utilize appropriate access/secret keys
- Copy code to local repo
- revise main.tf accordingly (see below)
- terraform init - initialize provide, modules and data files
- terraform plan
- terraform apply
- Verify functionality - review outputs and test resources created
- terraform destroy
- Congrats!! - you are ready for the basecamp

### Assumptions
------
- Assumes the AWS Access and Secret keys are configured locally as part of AWSCLI config.  Do not put the keys into the terraform modules - practice sound security principles and reinforce this throughout the basecamp.
- AWS KeyPair in the target account. If there are no KeyPairs then create a keypair in the target account/region.  Remember to keep the private key one local machine so that you can login into the web servers
- US-EAST-1 is the default region, if you want to utilize a different region then update the script accordingly
- region, ami-id, vpc module, aws_region and several other variables can be easily modified

### Input Variables
------
- Default values set for all variables in main.tf.  Update main.tf or use command line overrides as needed
- Assumes the AWS Access and Secret keys are configured locally as part of AWSCLI config.  They can also be provided via the command line (uugghh - don't do that!!)
- AWS Key Pair that resides in the AWS account. If there are no KeyPairs then create a keypair in the target account/region.  Remember to keep the private key one local machine so that you can login into the web servers
- US-EAST-1 is the default region, if you want to utilize a different region then update the script accordingly
- region, ami-id, vpc module, aws_region and several other variables can be easily modified

### Terraform Outputs
----------------------
| Output | Purpose |
|:-------- |:--------|
elb dns name | Full elb dns name so participants can test
web servers 1 ip address | Allow participants to test individual web servers and ssh to instances
web servers 2 ip address | Allow participants to test individual web servers and ssh to instances

### Terraform Templates
----------------------
| Template | Purpose |
|:-------- |:--------|
main.tf | All resource creation, variables and outputs
vpcs.tf | Creates the VPC (https://github.com/2ndWatch/tfm_aws_vpc.git?ref=1.1.1)

### Environment Input Variables - interface.tf
----------------------

| Variable | Default |
|:-------- |:-------------|
environment_tag | 2w_aws_essentials_demo
vpc_cidr  | 10.0.0.0/16
public_subnet_cidr | ["10.0.0.0/24", "10.0.1.0/24"]
private_subnet_cidr | ["10.0.2.0/24", "10.0.3.0/24"]
web_server_instance_ami | ami-97785bed
web_server_instance_type | t2.micro
instance_key_pair | < update with your key pair >
private_key_location | < ex: /Users/clownshoes/.ssh/id_rsa >

Authors
=======

[Kevin Dillon](kdillon@2ndwatch.com)


