# Get the default VPC
data "aws_vpc" "default" {
  default = true
}

# Get your IP address dynamically (or you can hardcode it)
data "http" "my_ip" {
  url = "http://checkip.amazonaws.com/"
}

resource "aws_security_group" "bastion_host_sg" {
  name        = "bastion-host-sg"
  description = "Allow SSH from my IP"
  vpc_id      = data.aws_vpc.default.id

  # Inbound Rule: Allow SSH from your IP address
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${trimspace(data.http.my_ip.body)}/32"]
  }

  # Outbound Rule: Allow all traffic to all IP addresses
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion-host-sg"
  }
}

resource "aws_security_group" "private_linux_host_sg" {
  name        = "private-linux-host-sg"
  description = "Allow SSH from my IP"
  vpc_id      = data.aws_vpc.default.id

  # Inbound Rule: Allow SSH from your IP address
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_host_sg.id]
  }

  # Outbound Rule: Allow all traffic to all IP addresses
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion-host-sg"
  }
}


output "bastion_host_security_group_name" {
  value = aws_security_group.bastion_host_sg.name
}

output "private_linux_host_sg_name" {
  value = aws_security_group.private_linux_host_sg.name
}