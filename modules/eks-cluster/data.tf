data "aws_availability_zones" "available" {}

data "aws_eks_cluster_auth" "eks_cluster" {
  name = module.eks.cluster_name
}
