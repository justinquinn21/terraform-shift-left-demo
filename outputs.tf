output "argocd_url" {
  value = data.kubernetes_service.argocd_service.status[0].load_balancer[0].ingress[0].hostname
}

output "argocd_password" {
  value = nonsensitive(data.kubernetes_secret_v1.argocd_password.data["password"])
}

output "kubernetes_connector_name" {
  value = module.eks_services.kubernetes_connector_name
}
