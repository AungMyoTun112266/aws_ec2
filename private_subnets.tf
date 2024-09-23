
resource "aws_subnet" "private_subnet" {
  vpc_id                  = data.aws_vpc.default.id
  cidr_block              = "172.31.48.0/20"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private Subnet"
  }
}

# Output the private subnet ID for reference
output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}