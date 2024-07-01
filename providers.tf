provider "aws" {
  region = "us-east-1"
  alias  = "us-east-1"
}

provider "kubernetes" {
  host                   = module.eks_cluster.endpoint
  cluster_ca_certificate = base64decode(module.eks_cluster.ca_certificate)
  token                  = module.eks_cluster.token
}

provider "helm" {
  kubernetes {
    host                   = module.eks_cluster.endpoint
    cluster_ca_certificate = base64decode(module.eks_cluster.ca_certificate)
    token                  = module.eks_cluster.token
  }
}

provider "kubectl" {
  apply_retry_count      = 5
  host                   = module.eks_cluster.endpoint
  cluster_ca_certificate = base64decode(module.eks_cluster.ca_certificate)
  token                  = module.eks_cluster.token
  load_config_file       = false
}