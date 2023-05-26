data "kubernetes_service" "argocd_service" {
  metadata {
    name      = "argocd-server"
    namespace = "argocd"
  }

  depends_on = [
    module.eks_services
  ]
}

data "kubernetes_secret_v1" "argocd_password" {
  metadata {
    name      = "argocd-initial-admin-secret"
    namespace = "argocd"
  }

  depends_on = [
    module.eks_services
  ]
}
