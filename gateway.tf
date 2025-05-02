
resource "aws_internet_gateway" "reth_vpc_igw" {
  vpc_id = aws_vpc.reth_vpc.id
}
