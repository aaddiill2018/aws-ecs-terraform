# Internet Gateway for the VPC
resource "aws_internet_gateway" "ajalah_prod_igw" {
  vpc_id = aws_vpc.ajalah_prod.id

  tags = {
    Name = "ajalah-prod-igw"
  }
}

# NAT Gateway for Public Subnets
resource "aws_eip" "ajalah_prod_nat_eip_a" {
  vpc = true
}

resource "aws_nat_gateway" "ajalah_prod_nat_a" {
  allocation_id = aws_eip.ajalah_prod_nat_eip_a.id
  subnet_id     = aws_subnet.public_a.id

  tags = {
    Name = "ajalah-prod-nat-gw-a"
  }
}

resource "aws_eip" "ajalah_prod_nat_eip_b" {
  vpc = true
}

resource "aws_nat_gateway" "ajalah_prod_nat_b" {
  allocation_id = aws_eip.ajalah_prod_nat_eip_b.id
  subnet_id     = aws_subnet.public_b.id

  tags = {
    Name = "ajalah-prod-nat-gw-b"
  }
}

resource "aws_eip" "ajalah_prod_nat_eip_c" {
  vpc = true
}

resource "aws_nat_gateway" "ajalah_prod_nat_c" {
  allocation_id = aws_eip.ajalah_prod_nat_eip_c.id
  subnet_id     = aws_subnet.public_c.id

  tags = {
    Name = "ajalah-prod-nat-gw-c"
  }
}

# Route Tables for public and private subnets
resource "aws_route_table" "ajalah_prod_public_rt" {
  vpc_id = aws_vpc.ajalah_prod.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ajalah_prod_igw.id
  }

  tags = {
    Name = "ajalah-prod-public-rt"
  }
}

resource "aws_route_table" "ajalah_prod_private_rt_a" {
  vpc_id = aws_vpc.ajalah_prod.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ajalah_prod_nat_a.id
  }

  tags = {
    Name = "ajalah-prod-private-rt-a"
  }
}

resource "aws_route_table" "ajalah_prod_private_rt_b" {
  vpc_id = aws_vpc.ajalah_prod.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ajalah_prod_nat_b.id
  }

  tags = {
    Name = "ajalah-prod-private-rt-b"
  }
}

resource "aws_route_table" "ajalah_prod_private_rt_c" {
  vpc_id = aws_vpc.ajalah_prod.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ajalah_prod_nat_c.id
  }

  tags = {
    Name = "ajalah-prod-private-rt-c"
  }
}

# Route Table Associations
resource "aws_route_table_association" "public_rt_assoc_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.ajalah_prod_public_rt.id
}

resource "aws_route_table_association" "public_rt_assoc_b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.ajalah_prod_public_rt.id
}

resource "aws_route_table_association" "public_rt_assoc_c" {
  subnet_id      = aws_subnet.public_c.id
  route_table_id = aws_route_table.ajalah_prod_public_rt.id
}

resource "aws_route_table_association" "private_rt_assoc_a" {
  subnet_id      = aws_subnet.app_subnet_a.id
  route_table_id = aws_route_table.ajalah_prod_private_rt_a.id
}

resource "aws_route_table_association" "private_rt_assoc_b" {
  subnet_id      = aws_subnet.app_subnet_b.id
  route_table_id = aws_route_table.ajalah_prod_private_rt_b.id
}

resource "aws_route_table_association" "private_rt_assoc_c" {
  subnet_id      = aws_subnet.app_subnet_c.id
  route_table_id = aws_route_table.ajalah_prod_private_rt_c.id
}
