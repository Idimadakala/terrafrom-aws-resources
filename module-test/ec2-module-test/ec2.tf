module "ec2" {
    source = "../../modules/ec2"
    ami_id = local.ami_id
    sg_ids = [local.sg_id]
    instance_type = var.instance_type
    tags = var.tags
    #vpc_security_group_ids = [local.sg_id]
}

module "securitygroup" {
    source = "../../modules/securitygroup"
    sg_name = var.sg_name
    sg_description = var.sg_description
    vpc_id = local.vpc_id
    project = var.project
    environment = var.environment
}

resource "aws_security_group_rule" "sg_rules" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.securitygroup.sg_id
}