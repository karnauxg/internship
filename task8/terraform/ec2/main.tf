provider "aws" {
  profile = "saml"
  region  = var.region
}

resource "aws_key_pair" "ssh" {
  key_name   = "ivssh2"
#  public_key = var.ssh_pair
  public_key = file("keys.pub")
  tags = {
    Name = "ivtest"
  }
}

resource "aws_security_group" "ubuntu" {
  name        = "ubuntu-security-group"
  description = "Allow SSH connect"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ivtest"
  }
}

resource "aws_instance" "ubuntu" {
  key_name      = aws_key_pair.ssh.key_name
#  ami           = data.aws_ami.ubuntu.id
  ami = "ami-08962a4068733a2b6"
  instance_type = "t2.micro"

  tags = {
    Name = "ivtest"
  }

  vpc_security_group_ids = [
    aws_security_group.ubuntu.id
  ]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("key")
    host        = self.public_ip
  }

}

