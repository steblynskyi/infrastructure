resource "aws_vpc_peering_connection" "mgmt_to_dev" {
  peer_vpc_id = var.dev_vpc_id
  vpc_id      = var.mgmt_vpc_id
  auto_accept = true

  tags = {
    Terraform   = var.tag_terraform
    Environment = var.environment
    Name        = var.name
    Description = var.description
  }
}

resource "aws_route" "dev_to_mgmt_route" {
  route_table_id            = var.dev_vpc_route_id
  destination_cidr_block    = var.mgmt_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.mgmt_to_dev.id
}

resource "aws_route" "mgmt_to_dev_route" {
  route_table_id            = var.mgmt_vpc_route_id
  destination_cidr_block    = var.dev_vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.mgmt_to_dev.id
}

resource "aws_route" "dev_kube_a_to_mgmt_route" {
  route_table_id            = var.dev_vpc_route_kube_a_id
  destination_cidr_block    = var.mgmt_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.mgmt_to_dev.id
}

resource "aws_route" "dev_kube_b_to_mgmt_route" {
  route_table_id            = var.dev_vpc_route_kube_b_id
  destination_cidr_block    = var.mgmt_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.mgmt_to_dev.id
}