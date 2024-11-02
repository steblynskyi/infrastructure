resource "aws_vpc_peering_connection" "us_access_to_qa" {
  peer_vpc_id = var.qa_vpc_id
  vpc_id      = var.us_access_vpc_id
  auto_accept = true

  tags = {
    Terraform   = var.tag_terraform
    Environment = var.environment
    Name        = var.name
    Description = var.description
  }
}

resource "aws_route" "qa_to_us_access_route" {
  route_table_id            = var.qa_vpc_route_id
  destination_cidr_block    = var.us_access_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.us_access_to_qa.id
}

resource "aws_route" "us_access_to_qa_route" {
  route_table_id            = var.us_access_vpc_route_id
  destination_cidr_block    = var.qa_vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.us_access_to_qa.id
}

resource "aws_route" "qa_kube_a_to_us_access_route" {
  route_table_id            = var.qa_vpc_route_kube_a_id
  destination_cidr_block    = var.us_access_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.us_access_to_qa.id
}

resource "aws_route" "qa_kube_b_to_us_access_route" {
  route_table_id            = var.qa_vpc_route_kube_b_id
  destination_cidr_block    = var.us_access_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.us_access_to_qa.id
}