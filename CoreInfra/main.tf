provider "aws" {
  region = "${var.region}"
}

resource "aws_vpc" "myVPC" {
  cidr_block = "${var.vpc_cidr_block}"

  tags = {
    Name = "myVPC"
    ENV  = "training-tf"
  }
}

resource "aws_subnet" "mySubnet" {
  vpc_id     = "${aws_vpc.myVPC.id}"
  cidr_block = "${var.sn_cidr_block}"

  tags = {
    Name = "mySubnet"
    ENV  = "training-tf"
  }
}

resource "aws_route_table" "myRouteTable" {
  vpc_id = "${aws_vpc.myVPC.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.myGateway.id}"
  }

  tags = {
    Name = "mySubnet"
    ENV  = "training-tf"
  }
}

resource "aws_internet_gateway" "myGateway" {
  vpc_id = "${aws_vpc.myVPC.id}"

  tags = {
    Name = "myGateway"
    ENV  = "training-tf"
  }
}

resource "aws_route_table_association" "myRouteAssociation" {
  subnet_id      = "${aws_subnet.mySubnet.id}"
  route_table_id = "${aws_route_table.myRouteTable.id}"
}
