module "ec2" {
    source = "git::https://github.com/Idimadakala/terraform-aws-resources.git//modules/ec2?ref=develop"
    ami_id = local.ami_id
    #sg_ids = var.sg_ids
    sg_ids = local.sg_id
    instance_type = var.instance_type
    tags = var.tags
    #vpc_security_group_ids = [local.sg_id]
}

module "securitygroup" {
    source = "git::https://github.com/Idimadakala/terrafrom-aws-resources.git//modules/securitygroup?ref=develop"
    sg_name = var.sg_name
    sg_description = var.sg_description
    vpc_id = local.vpc_id
    project = var.project
    environment = var.environment
}