module "eks_cluster" {
  source = "./modules/eks-cluster"

  providers = {
    aws.us-east-1 = aws.us-east-1
  }

  cluster_version = var.eks_cluster_version
  mapped_roles    = var.mapped_roles
  mapped_users    = var.mappped_users
  region          = var.region
  resource_prefix = var.resource_prefix
}

module "eks_services" {
  source = "./modules/eks-services"

  resource_prefix = var.resource_prefix

  k8s_ca_certificate = module.eks_cluster.ca_certificate
  k8s_endpoint       = module.eks_cluster.endpoint
  k8s_token          = module.eks_cluster.token

  use_wiz_admission_controller           = var.use_wiz_admission_controller
  wiz_admission_controller_client_id     = var.wiz_admission_controller_client_id
  wiz_admission_controller_client_secret = var.wiz_admission_controller_client_secret
  wiz_admission_controller_mode          = var.wiz_admission_controller_mode
  wiz_admission_controller_policies      = var.wiz_admission_controller_policies

  depends_on = [module.eks_cluster]
}

resource "time_sleep" "argo_wait" {
  depends_on = [module.eks_services]

  destroy_duration = var.argocd_destroy_wait
}

resource "kubectl_manifest" "argo_cd_application" {
  yaml_body = <<-YAML
    apiVersion: argoproj.io/v1alpha1
    kind: Application
    metadata:
      name: ${var.argocd_application_name}
      namespace: argocd
      finalizers:
      - resources-finalizer.argocd.argoproj.io
    spec:
      project: default
      source:
        repoURL: ${var.git_repo_url}
        targetRevision: HEAD
        path: ${var.git_repo_manifest_path}
      destination:
        server: https://kubernetes.default.svc
        namespace: ${var.argocd_application_namespace}
      syncPolicy:
        automated:
          prune: true
          allowEmpty: true
        syncOptions:
        - CreateNamespace=true
        - PruneLast=true
  YAML

  depends_on = [
    module.eks_services,
    time_sleep.argo_wait
  ]
}
