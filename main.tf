provider "aws" {
  region = var.aws_region
}

resource "aws_elasticache_parameter_group" "mulesoft_params_group" {
  name   = var.params_groups_name
  family = var.params_groups_family

  description = "Custom parameter for redis mulesoft "
}


resource "aws_elasticache_cluster" "mulesoft_redis" {
  cluster_id           = "cluster-example"
  engine               = "redis"

  node_type            = var.node_type
  num_cache_nodes      = 1

  parameter_group_name = aws_elasticache_parameter_group.mulesoft_params_group.name
  engine_version       = var.redis_version

  subnet_group_name = aws_elasticache_subnet_group.mulesoft_elasticache_subnet.name
  security_group_ids = [aws_security_group.sg_cache.id]
  port                 = 6379

  apply_immediately             = true
  maintenance_window            = "sun:06:00-sun:07:00"
}
