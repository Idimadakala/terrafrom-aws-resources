#mandatory
variable "sg_name" {
    type = string
}
#mandatory
variable "sg_description" {
    type = string
}
#mandatory
variable "vpc_id" {
    type = string
  
}
#mandatory
variable "project" {
    type = string
  
}
#mandatory
variable "environment" {
    type = string
  
}
#optional
variable "sg_tags" {
    type = map(string)
    default = {}
  
}