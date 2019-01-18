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

data "aws_availability_zones" "available" {}

resource "aws_subnet" "mySubnet" {
  count      = 2
  vpc_id     = "${aws_vpc.myVPC.id}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block = "${element(var.sn_cidr_block_public, count.index)}"

  #   "${var.sn_cidr_block}"

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
  count          = 2
  subnet_id      = "${element(aws_subnet.mySubnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.myRouteTable.id}"
}
