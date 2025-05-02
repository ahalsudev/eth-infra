resource "aws_route_table" "reth_vpc_route_table" {
  vpc_id = aws_vpc.reth_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.reth_vpc_igw.id
  }
}

resource "aws_route_table_association" "main_subnet_association" {
  subnet_id      = aws_subnet.main_subnet.id
  route_table_id = aws_route_table.reth_vpc_route_table.id
}