variable "ami_id"{
    type = string
     #default = "ami-09c813fb71547fc4f"
     description = "Provide AMI Id for the ec2 instance"
}

variable "instance_type"{
    type = string
    default = "t3.micro"
    description = "Instance type"

    validation {
      condition = contains(["t3.micro","t3.small","t3.medium"],var.instance_type)
      error_message = "Valid values for instance_type are: t3.micro, t3.small, t3.medium"
    }
}

variable "sg_ids" {
    type = list
}

variable "tags" {
  type = map
}

