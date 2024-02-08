data "aws_availability_zones" "available" {}

data "aws_ecrpublic_authorization_token" "token" {
  provider = aws.us-east-1
}

data "aws_eks_cluster_auth" "eks_cluster" {
  name = module.eks.cluster_name

  depends_on = [
    module.eks
  ]
}
