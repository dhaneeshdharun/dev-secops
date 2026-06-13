resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gateway.id
  }
    tags = {
        Name = "nec-private-route-table"
    }
}

resource "aws_route_table_association" "private-route-table-association1" {
  subnet_id = aws_subnet.private-subnet1.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "private-route-table-association2" {
  subnet_id = aws_subnet.private-subnet2.id
  route_table_id = aws_route_table.private-route-table.id
}