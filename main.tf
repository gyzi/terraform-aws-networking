
# Create a new instance of the latest RHEL 8 on an
# t2.micro node with an AWS Tag naming it "odoo"
provider "aws" {
  region = "ap-northeast-1"
  access_key = var.my_access_key
  secret_key = var.my_secret_key
}

data "aws_instance" "tuts" {
  filter {
    name = "tag:env"
    values = ["odoo"]
  }
}

resource "aws_instance" "tuts-ec2" {
  instance_id = data.aws_instance.tuts.id
  tags = {
    phase = "staging"
  }
}

output "ec2-data" {
  value = data.aws_instance.tuts
}
/* output "ec2-pub-ip" {
    value = aws_instance.web.public_ip
} */