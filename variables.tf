variable "aws_region" {}
variable "vpc_cidr" {}
variable "vpc_id" {}

variable "redis_version" {} #6.x
variable "params_groups_name" {} #"mulesoft-params-redis"
variable "params_groups_family" {} #redis6.x

variable "cluster_name" {}
variable "node_type" {}