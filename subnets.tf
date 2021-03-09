data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "mulesoft_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.vpc_cidr
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    ProductOwner = "Mulesoft-FICO"
  }
}

resource "aws_elasticache_subnet_group" "mulesoft_elasticache_subnet" {
  name       = "mulesoft-subnet-redis"
  subnet_ids = [aws_subnet.mulesoft_subnet.id]
}
