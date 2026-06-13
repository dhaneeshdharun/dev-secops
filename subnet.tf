resource "aws_subnet" "public-subnet1" {
  vpc_id = aws_vpc.vpc.id
  availability_zone = "ap-northeast-1a"
  cidr_block = "10.0.0.0/26"
  map_public_ip_on_launch = true
  tags = {
    Name = "nec-public-subnet-1"
    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_subnet" "public-subnet2" {
  vpc_id = aws_vpc.vpc.id
  availability_zone = "ap-northeast-1c"
  cidr_block = "10.0.0.64/26"
  map_public_ip_on_launch = true
    tags = {
        Name = "nec-public-subnet-2"
        "kubernetes.io/role/elb" = "1"
    }
}

resource "aws_subnet" "private-subnet1" {
  vpc_id = aws_vpc.vpc.id
  availability_zone = "ap-northeast-1a"
  cidr_block = "10.0.0.128/26"
    tags = {
        Name = "nec-private-subnet-1"
    }
}

resource "aws_subnet" "private-subnet2" {
  vpc_id = aws_vpc.vpc.id
  availability_zone = "ap-northeast-1c"
  cidr_block = "10.0.0.192/26"
    tags = {
        Name = "nec-private-subnet-2"
    }
}