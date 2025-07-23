locals {
  ami_id = data.aws_ami.joindevsops.id
  vpc_id = data.aws_vpc.default.id
  sg_id = module.securitygroup.sg_id
}