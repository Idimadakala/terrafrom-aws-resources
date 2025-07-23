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
    source = "../../modules/docker"
    ami_id = local.ami_id
    sg_ids = [local.sg_id]
    instance_type = var.instance_type
    tags = var.tags
    #vpc_security_group_ids = [local.sg_id] # commented since we are default VPC 
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

# usage of null_resource to ensure the docker installation is done after the EC2 instance is created
resource "null_resource" "docker_installation" {
  depends_on = [module.ec2, terraform_data.install_docker]

  provisioner "local-exec" {
    command = "echo 'Docker installation completed on EC2 instance, ${module.ec2.instance_id} and public IP is ${module.ec2.public_ip}'"
  }
}

# usage of null_resource
/* resource "null_resource" "delete_remote_files" {
  triggers ={
    always = "${timestamp()}"
  }

  provisioner "remote-exec" {
    inline = [
      "rm -f /tmp/bootstrap.sh"
    ]
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    password = "DevOps321"
    host = module.ec2.public_ip
    #private_key = file("~/.ssh/your-key.pem")
  }
 
} */