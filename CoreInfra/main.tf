provider "aws" {
    region= "${var.region}" 
}

resource "aws_vpc" "myVPC" {
  cidr_block = "${var.vpc_cidr_block}"
}
