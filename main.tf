
# Create a new instance of the latest RHEL 8 on an
# t2.micro node with an AWS Tag naming it "odoo"
provider "aws" {
  region = "ap-northeast-1"
}

data "aws_instance" "tuts" {
  filter {
    name = "private_ip"
    value = ["172.31.33.40"]
  }
}


output "ec2-data" {
  value = data.aws_instance.tuts
}
/* output "ec2-pub-ip" {
    value = aws_instance.web.public_ip
} */