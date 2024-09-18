# Create EC2 instance
resource "aws_instance" "ubuntu_ec2" {
  ami             = "ami-0cab37bd176bb80d3"
  instance_type   = "t2.micro" # Free tier eligible
  key_name        = aws_key_pair.this.key_name
  subnet_id       = var.public_default_subnet
  vpc_security_group_ids = [aws_security_group.bastion_host_sg.id]

  tags = {
    Name = "bastion-host"
  }
}


resource "aws_instance" "private_linux_host" {
  ami             = "ami-0cab37bd176bb80d3"
  instance_type   = "t2.micro" # Free tier eligible
  key_name        = aws_key_pair.this.key_name
  subnet_id       = aws_subnet.private_subnet.id
  vpc_security_group_ids = [aws_security_group.private_linux_host_sg.id]

  tags = {
    Name = "private-linux-host"
  }
}

# Output the instance public IP for convenience
output "instance_public_ip" {
  value = aws_instance.ubuntu_ec2.public_ip
}
