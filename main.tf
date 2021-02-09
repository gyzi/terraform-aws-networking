
# Create a new instance of the latest RHEL 8 on an
# t2.micro node with an AWS Tag naming it "odoo"
provider "aws" {
  region = "ap-northeast-1"
}

data "aws_instance" "i-03ac896b107a2367f" {
  tags = var.my_instance_tag
}


output "ec2-data" {
  value = data.aws_instance.i-03ac896b107a2367f
}
/* output "ec2-pub-ip" {
    value = aws_instance.web.public_ip
} */