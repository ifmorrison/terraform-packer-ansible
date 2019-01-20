resource "aws_vpc" "basic" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "basic vpc"
  }
}

resource "aws_subnet" "basic" {
  vpc_id            = "${aws_vpc.basic.id}"
  cidr_block        = "172.16.10.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "basic subnet"
  }
}

resource "aws_network_interface" "basic" {
  subnet_id   = "${aws_subnet.basic.id}"
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "primary_network_interface"
  }
}

# create VPC Network access control list
resource "aws_network_acl" "basic" {
  vpc_id = "${aws_vpc.basic.id}"
  subnet_ids = [ "${aws_subnet.basic.id}" ]
# allow port 22
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }
  }

resource "aws_internet_gateway" "basic" {
  vpc_id = "${aws_vpc.basic.id}"
} 

resource "aws_route_table" "basic" {
    vpc_id = "${aws_vpc.basic.id}"
    }

resource "aws_route" "basic" {
  route_table_id        = "${aws_route_table.basic.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.basic.id}"
}

resource "aws_route_table_association" "basic" {
    subnet_id      = "${aws_subnet.basic.id}"
    route_table_id = "${aws_route_table.basic.id}"
}

