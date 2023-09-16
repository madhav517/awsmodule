resource "aws_route_table" "SampleRoutetable" {
  vpc_id = var.awsvpcid

  route {
    cidr_block = var.cidrblock
    gateway_id = var.internet_gateway
  }

  tags = {
    Name = "SampleRoutetable"
  }
}

resource "aws_route_table_association" "SampleRouteAssociatiion" {
  subnet_id      = var.subnetid
  route_table_id = aws_route_table.SampleRoutetable.id
}