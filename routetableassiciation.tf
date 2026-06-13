resource "aws_route_table_association" "route-table-association1" {
  subnet_id = aws_subnet.public-subnet1.id
  route_table_id = aws_route_table.route-table.id
}

resource "aws_route_table_association" "route-table-association2" {
  subnet_id = aws_subnet.public-subnet2.id
  route_table_id = aws_route_table.route-table.id
}