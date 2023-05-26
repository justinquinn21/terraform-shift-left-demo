locals {
  cluster_name    = "${var.resource_prefix}-cluster"
  cluster_version = var.cluster_version
  region          = var.region

  vpc_cidr = var.vpc_cidr
  vpc_name = "${var.resource_prefix}-vpc"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = var.tags
}
