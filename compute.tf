resource "aws_instance" "reth_node" {
  ami           = "ami-0f0c3baa60262d5b9" # Ubuntu 22.04 - eu-west-1
  instance_type = "c5ad.2xlarge"          # 8 vCPU, 16GB RAM

  network_interface {
    network_interface_id = aws_network_interface.reth_node_interface.id
    device_index         = 0
  }

  user_data = <<-EOF
              #!/bin/bash
              mkdir -p /home/ubuntu/.ssh
              echo "${file("reth-node-pub.pem")}" > /home/ubuntu/.ssh/authorized_keys
              chown -R ubuntu:ubuntu /home/ubuntu/.ssh
              chmod 700 /home/ubuntu/.ssh
              chmod 600 /home/ubuntu/.ssh/authorized_keys
              EOF
}
