resource "aws_instance" "web" {
  ami           = "ami-0dc185deadd3ac449"
  instance_type = "t2.micro"
 subnet_id = aws_subnet.rhel-sub-pub.id 
  tags = var.my_instance_tag
}