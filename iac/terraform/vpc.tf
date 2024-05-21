resource "aws_vpc" "rameez" {
  cidr_block = "10.0.0.0/16"

  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.tag}-vpc"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.rameez.id

  tags = {
    Name = "${var.tag}-gw"
  }
}

resource "aws_subnet" "rameez" {
  vpc_id     = aws_vpc.rameez.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "${var.tag}-subnet"
  }
}

resource "aws_route_table" "example" {
  vpc_id = aws_vpc.rameez.id


  tags = {
    Name = "${var.tag}-rt"
  }
}

resource "aws_route" "r" {
  route_table_id            = aws_route_table.example.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.rameez.id
  route_table_id = aws_route_table.example.id
}