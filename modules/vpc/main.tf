resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "my-${var.environment}-vpc"
    Project = var.proj_name
    Environment = var.environment
    ManagedBy = var.managed_by
  }
}

resource "aws_subnet" "public_subnets" {
  for_each = var.public_subnets_objects

  vpc_id = aws_vpc.myvpc.id
  cidr_block = each.value.cidr
  availability_zone = each.value.availability_zone
  map_public_ip_on_launch = "true"

  tags = {
    Name = "my-${var.environment}-pub-subnet"
    Project = var.proj_name
    Environment = var.environment
    ManagedBy = var.managed_by
  }
}

resource "aws_subnet" "private_subnets" {
  for_each = var.private_subnets_objects

  vpc_id = aws_vpc.myvpc.id
  cidr_block = each.value.cidr
  availability_zone = each.value.availability_zone
  map_public_ip_on_launch = "true"

  tags = {
    Name = "my-${var.environment}-priv-subnet"
    Project = var.proj_name
    Environment = var.environment
    ManagedBy = var.managed_by
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name        = "my-${var.environment}-igw"
    Project     = var.proj_name
    Environment = var.environment
    ManagedBy   = var.managed_by
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name        = "my-${var.environment}-rt"
    Project     = var.proj_name
    Environment = var.environment
    ManagedBy   = var.managed_by
  }
}

resource "aws_route_table_association" "route" {
  route_table_id = aws_route_table.public-rt.id
  gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route" "route" {
  route_table_id = aws_route_table.public-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}
