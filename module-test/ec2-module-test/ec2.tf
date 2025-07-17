# security group module
module "securitygroup" {
    source = "../../modules/securitygroup"
    sg_name = var.sg_name
    sg_description = var.sg_description
    vpc_id = local.vpc_id
    project = var.project
    environment = var.environment
}
# rules for the security group
resource "aws_security_group_rule" "sg_rules" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.securitygroup.sg_id
}

# EC2 module
module "ec2" {
    source = "../../modules/ec2"
    ami_id = local.ami_id
    sg_ids = [local.sg_id]
    instance_type = var.instance_type
    tags = var.tags
    #vpc_security_group_ids = [local.sg_id]
}

# terraform_data to install the docker
resource "terraform_data" "install_docker" {
  triggers_replace = [
    module.ec2.instance_id
  ]

  provisioner "file" {
    source = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    password = "DevOps321"
    host = module.ec2.public_ip
  }

  provisioner "remote-exec" {
    inline = [ 
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh"
     ]
  }
}