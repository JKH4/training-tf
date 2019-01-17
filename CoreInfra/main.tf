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
  cidr_block = "${var.sn_cidr_block}"
  vpc_id     = "${aws_vpc.myVPC.id}"

  tags = {
    Name = "mySubnet"
    ENV  = "training-tf"
  }
}

resource "aws_route_table" "myRouteTable" {
  vpc_id = "${aws_vpc.myVPC.id}"

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
