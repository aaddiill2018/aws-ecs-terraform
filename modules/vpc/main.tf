resource "aws_vpc" "ajalah_prod" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "ajalah-prod-vpc"
  }
}

resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.ajalah_prod.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "me-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "ajalah-prod-vpc-public-subnet-a"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.ajalah_prod.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "me-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "ajalah-prod-vpc-public-subnet-b"
  }
}

resource "aws_subnet" "public_c" {
  vpc_id                  = aws_vpc.ajalah_prod.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "me-south-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "ajalah-prod-vpc-public-subnet-c"
  }
}
