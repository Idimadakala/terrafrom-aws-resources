variable "sg_name" {
    default = "allow-http-and-ssh"
  
}
variable "sg_description" {
    default = "allow ingress traffic for http and ssh and all outgoing traffic"
  
}

/* variable "vpc_id" {
    default = data.aws_vpc.default.id
  
} */

variable "project" {
    default = "roboshop"
  
}
variable "environment" {
  default = "dev"
}