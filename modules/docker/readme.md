We can use this module to create ec2 resource

usage:
1. import this module 
module "ec2"{
    source = "../terraform-ec2-instance"
}

Inputs:
1. ami_id(Optional):
2. instance_type(Optional):
3. sg_ids(Required):
4. tags(Required):
Outputs:
1. public_ip: output the public IP
2. private_ip: output the private IP
3. instance_id: output the Instance Id
