
resource "aws_route_table" "rhel-route-pub" {
  vpc_id = aws_vpc.rhel.id
  route {
    cidr_block = "10.0.0.0/24"
    gateway_id = aws_internet_gateway.rhel-ig.id
  }
  tags = {
    Name = "rhel-route-pub"
  }
}

resource "aws_route_table" "rhel-route-priv" {
  vpc_id = aws_vpc.rhel.id
  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_nat_gateway.rhel-natgw.id
  }
  tags = {
    Name = "rhel-route-priv"
  }
}

resource "aws_route_table_association" "rhel-route-priv-associate" {
  subnet_id      = aws_subnet.rhel-sub-priv.id
  route_table_id = aws_route_table.rhel-route-priv.id
}

resource "aws_route_table_association" "rhel-route-pub-associate" {
  subnet_id      = aws_subnet.rhel-sub-pub.id
  route_table_id = aws_route_table.rhel-route-pub.id
}