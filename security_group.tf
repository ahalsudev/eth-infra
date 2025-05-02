resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.reth_vpc.id
}

resource "aws_security_group" "reth_node_security_group" {
  name        = "reth_node_security_group"
  description = "Security group for the reth node"
  vpc_id      = aws_vpc.reth_vpc.id
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.reth_node_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22 # range start
  to_port           = 22 # range end
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "allow_prometheus_ipv4" {
  security_group_id = aws_security_group.reth_node_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 9090 # range start
  to_port           = 9090 # range end
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "allow_grafana_ipv4" {
  security_group_id = aws_security_group.reth_node_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 3000 # range start
  to_port           = 3000 # range end
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "allow_p2p_discovery_ipv4_tcp" {
  security_group_id = aws_security_group.reth_node_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 30303 # range start
  to_port           = 30304 # range end
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "allow_p2p_discovery_ipv4_udp" {
  security_group_id = aws_security_group.reth_node_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 30303 # range start
  to_port           = 30304 # range end
  ip_protocol       = "udp"
}


resource "aws_vpc_security_group_ingress_rule" "allow_p2p_lighthouse_ipv4_tcp" {
  security_group_id = aws_security_group.reth_node_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 9000 # range start
  to_port           = 9001 # range end
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "allow_p2p_lighthouse_ipv4_udp" {
  security_group_id = aws_security_group.reth_node_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 9000 # range start
  to_port           = 9001 # range end
  ip_protocol       = "udp"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.reth_node_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # all ports
}
