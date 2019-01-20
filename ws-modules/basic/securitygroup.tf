resource "aws_security_group" "allow_webservices" {
  vpc_id      = "aws_vpc.basic.id"
  name        = "allow_80"
  description = "Allow inbound port 80 and 443"

  ingress {
    from_port   = 0
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

tags = {
    Name = "basic"
  }
}
