provider "aws" {
  region = "${var.region}"
}

resource "aws_vpc" "myVPC" {
  cidr_block = "${var.vpc_cidr_block}"

  tags = {
    Name = "myVPC"
  }
}

resource "aws_subnet" "mySubnet" {
  cidr_block = "${var.sn_cidr_block}"
  vpc_id     = "${aws_vpc.myVPC.id}"

  tags = {
    Name = "mySubnet"
  }
}
