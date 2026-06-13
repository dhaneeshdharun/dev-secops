resource "aws_eip" "nat-eip" {
    domain = "vpc"
    tags = {
        Name = "nec-nat-eip"
    }
}

resource "aws_nat_gateway" "nat-gateway" {
    subnet_id = aws_subnet.public-subnet1.id
    allocation_id = aws_eip.nat-eip.id
    tags = {
        Name = "nec-nat-gateway"
    }
  
}