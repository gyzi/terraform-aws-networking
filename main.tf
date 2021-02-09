
# Create a new instance of the latest RHEL 8 on an
# t2.micro node with an AWS Tag naming it "odoo"
provider "aws" {
  access_key  =  var.my_acess_key
  secret_key  = var.my_secret_key
  region = "ap-northeast-1"
}

/* output "ec2-pub-ip" {
    value = aws_instance.web.public_ip
} */