data "aws_availability_zones" "available" {}

resource "aws_vpc" "vpc" {
  cidr_block           = var.network_cidr_block
  enable_dns_hostnames = true
  tags = {
    Name = "${var.user}-${var.business_unit}"
  }
}

resource "aws_subnet" "public_subnet" {
  cidr_block        = var.public_cidr_block
  vpc_id            = aws_vpc.vpc.id
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    "Name" = "${var.user}-${var.business_unit}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name" = "${var.user}-${var.business_unit}"
  }
}

resource "aws_route_table" "route_igw" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    "Name" = "${var.user}-${var.business_unit}"
  }
}

resource "aws_route_table_association" "rta_igw" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route_igw.id
}
