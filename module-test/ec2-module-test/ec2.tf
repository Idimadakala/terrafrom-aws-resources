module "this" {
    source = "../modules/ec2"
    ami_id = local.ami_id
    sg_ids = var.sg_ids
    instance_type = var.instance_type
    tags = var.tags
}

module "this" {
    source = "../modules/securitygroup"
    sg_name = var.sg_name
    sg_description = var.sg_description
    vpc_id = local.vpc_id
    project = var.project
    environment = var.environment
}