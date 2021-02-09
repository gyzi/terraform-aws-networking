
resource "aws_vpc" "rhel" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = "true" #gives you an internal domain name
  enable_dns_hostnames = "true" #gives you an internal host name
  enable_classiclink = "false"
  instance_tenancy = "default"
}

resource "aws_subnet" "rhel-sub-priv" {
  vpc_id     = aws_vpc.rhel.id
  availability_zone = "ap-northeast-1a"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "rhel-sub-priv"
  }
}

resource "aws_subnet" "rhel-sub-pub" {
  vpc_id     = aws_vpc.rhel.id
  availability_zone = "ap-northeast-1c"
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "rhel-sub-priv"
  }
}

resource "aws_internet_gateway" "rhel-ig" {
  vpc_id = aws_vpc.rhel.id
  tags = {
    Name = "rhel-ig"
  }
}

resource "aws_eip" "rhel-eip" {
  vpc      = true
}
resource "aws_nat_gateway" "rhel-natgw" {
  allocation_id = aws_eip.rhel-eip.id
  subnet_id     = aws_subnet.rhel-sub-pub.id
} 