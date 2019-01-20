data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# Now we have the latest ami ID we can deploy the instance


resource "aws_instance" "basic" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t3.medium"

  network_interface {
    network_interface_id = "${aws_network_interface.basic.id}"
    device_index         = 0
  }

  tags = {
    daily-ami-backup = "True"
  }

  user_data          = "${file("web.conf")}"

  key_name = "IrelandKey"
}
