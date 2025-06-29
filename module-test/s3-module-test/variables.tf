variable "bucket_name" {
    type = string
    #default = "terraform-aws-s3-dev"
    default = "roboshop-infra-joindevsecops-dev"
}

variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}