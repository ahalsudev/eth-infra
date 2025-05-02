
resource "aws_eip" "reth_node_eip" {
  instance = aws_instance.reth_node.id
  domain = "vpc"
}

resource "aws_eip_association" "reth_node_eip_association" {
  instance_id = aws_instance.reth_node.id
  allocation_id = aws_eip.reth_node_eip.id
}