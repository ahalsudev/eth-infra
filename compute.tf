resource "aws_instance" "reth_node" {
  ami           = "ami-0f0c3baa60262d5b9" # Ubuntu 22.04 - eu-west-1
  instance_type = "c5ad.2xlarge" # 8 vCPU, 16GB RAM

  network_interface {
    network_interface_id = aws_network_interface.reth_node_interface.id
    device_index         = 0
  }
}