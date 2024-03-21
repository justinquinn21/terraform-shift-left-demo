locals {
  cluster_name    = "${var.resource_prefix}-cluster"
  cluster_version = var.cluster_version
  region          = var.region

  cluster_admins = length(var.cluster_admins) > 0 ? var.cluster_admins : [data.aws_iam_session_context.current.issuer_arn]
  cluster_admin_access_entries = {
    for i, user in local.cluster_admins :
    "cluster_admin_${i + 1}" => {
      principal_arn = "${user}"
      type          = "STANDARD"

      policy_associations = {
        admin = {
          policy_arn = "arn:${data.aws_partition.current.id}:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }

  vpc_cidr = var.vpc_cidr
  vpc_name = "${var.resource_prefix}-vpc"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = var.tags
}
