output "ca_certificate" {
  value = module.eks.cluster_certificate_authority_data
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "endpoint" {
  value = module.eks.cluster_endpoint
}

output "karpenter" {
  value = helm_release.karpenter
}

output "node_role_arn" {
  value = module.eks.cluster_iam_role_arn
}

output "token" {
  value = data.aws_eks_cluster_auth.eks_cluster.token
}

output "vpc" {
  value = module.vpc.vpc_id
}
