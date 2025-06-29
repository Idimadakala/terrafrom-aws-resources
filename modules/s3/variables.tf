variable "project" {
    default = "self"
}

variable "environment" {
    default = "dev"
}

variable "bucket_name" {
    type = string
}

variable "s3_tags" {
    type = map(string)
    default = {}
  
}