# Create Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my-vpc.id
}

# Create Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.my-vpc.id
}

resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.my-sub.id
  route_table_id = aws_route_table.public.id
}
