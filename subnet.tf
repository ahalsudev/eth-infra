resource "aws_subnet" "main_subnet" {
  vpc_id            = aws_vpc.reth_vpc.id
  cidr_block        = "172.16.1.0/24"
  availability_zone = "eu-west-1a"
}
