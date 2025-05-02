resource "aws_network_interface" "reth_node_interface" {
  subnet_id   = aws_subnet.main_subnet.id
  private_ips = ["172.16.1.10"]
  security_groups = [aws_security_group.reth_node_security_group.id]
}
