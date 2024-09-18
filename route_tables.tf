# Create the route table
resource "aws_route_table" "private_linux_host_rtb" {
  vpc_id = data.aws_vpc.default.id

  # Optionally add routes if needed (e.g., to NAT Gateway for outbound traffic)
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "private-db-server-rtb"
  }
}

# Associate the route table with the private subnet
resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_linux_host_rtb.id
}

# Output the route table ID for reference
output "route_table_id" {
  value = aws_route_table.private_linux_host_rtb.id
}