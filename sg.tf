resource "aws_security_group" "sg_cache" {
  name        = "mulesoft_redis_sg"
  description = "SG for Redis"
  vpc_id      = var.vpc_id

  tags = {
    Name           = var.cluster_name
  }
}