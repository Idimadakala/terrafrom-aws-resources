module "main" {
    source = "../securitygroup"
    sg_name = var.sg_name
    sg_description = var.sg_description
    vpc_id = data.aws_vpc.default.id
    project = var.project
    environment = var.environment
    
    
}