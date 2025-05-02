resource "aws_ebs_volume" "node_volume" {
  availability_zone = "eu-west-1a"
  size              = 2500
  type              = "gp3"
  iops              = "16000"
}

resource "aws_volume_attachment" "node_volume_attachment" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.node_volume.id
  instance_id = aws_instance.reth_node.id
}
