variable "sg_ids" {
    default = ["sg-063542cf566144240"]
  
}

variable "instance_type" {
    default = "t3.micro"
}

variable "tags" {
    default = {
        Name = "joindevops-ami"
        Terraform = "true"
        Environment = "dev"
    }
  
}

# security group variables
variable "sg_name" {
    default = "joindevops-ami-sg"
}

variable "sg_description" {
    default = "Security group for joindevops-ami"
}

variable "project" {
    default = "joindevops"
}

variable "environment" {
    default = "dev"
}