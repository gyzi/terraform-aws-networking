
variable "vpc_cidr" {
   cidr_block = string
   default = "10.0.0.0/16"
}

variable "pub_sub_cidr" {
   cidr_block = string
   default = "10.0.0.0/24"
}

variable "priv_sub_cidr" {
   cidr_block = string
   default = "10.0.1.0/24"
}

variable "my_instance_tag" {
   type = object({
      Name = string
      env  = number
   })
   description = "This to set tag for resources"
}

variable "instance_type" {
   instance_type = string
   default = "t2.micro"
   description = "to set instance type"
}

variable "my_access_key" {
   access_key = string
}
variable "my_secret_key" {
   secret_key = string
}