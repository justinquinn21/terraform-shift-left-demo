resource "random_id" "uniq" {
  byte_length = 4
}

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = kubernetes_namespace.argocd.id

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }
}

resource "kubernetes_namespace" "wiz" {
  metadata {
    name = var.wiz_namespace
  }
}

resource "helm_release" "wiz_admission_controller" {
  count = var.use_wiz_admission_controller ? 1 : 0

  name       = "wiz-admission-controller"
  repository = "https://wiz-sec.github.io/charts/"
  chart      = "wiz-admission-controller"
  namespace  = kubernetes_namespace.wiz.id

  set {
    name  = "wizApiToken.clientId"
    value = var.wiz_admission_controller_client_id
  }
  set {
    name  = "wizApiToken.clientToken"
    value = var.wiz_admission_controller_client_secret
  }
  set {
    name  = "opaWebhook.errorEnforcementMethod"
    value = var.wiz_admission_controller_mode
  }
  set {
    name  = "opaWebhook.policyEnforcementMethod"
    value = var.wiz_admission_controller_mode
  }
  dynamic "set" {
    for_each = var.wiz_admission_controller_policies
    content {
      name  = "opaWebhook.policies[${index(var.wiz_admission_controller_policies, set.value)}]"
      value = set.value
    }
  }
}

resource "kubernetes_cluster_role" "wiz_kube_connector" {
  metadata {
    name = "wiz-kube-connector"
  }

  rule {
    verbs      = ["get", "list", "watch"]
    api_groups = ["*"]
    resources  = ["*"]
  }
}

resource "kubernetes_service_account" "wiz_kube_connector" {
  metadata {
    name      = "wiz-kube-connector"
    namespace = kubernetes_namespace.wiz.id
  }
}

resource "kubernetes_secret" "wiz_kube_connector_token" {
  metadata {
    name      = "wiz-kube-connector-token"
    namespace = kubernetes_namespace.wiz.id

    annotations = {
      "kubernetes.io/service-account.name" = "wiz-kube-connector"
    }
  }
  type = "kubernetes.io/service-account-token"

  depends_on = [kubernetes_service_account.wiz_kube_connector]
}

resource "kubernetes_cluster_role_binding" "wiz_kube_connector" {
  metadata {
    name = "wiz-kube-connector"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "wiz-kube-connector"
    namespace = kubernetes_namespace.wiz.id
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "wiz-kube-connector"
  }
}

resource "time_sleep" "wait_5_seconds_for_token_generation" {
  create_duration = "5s"
  depends_on      = [kubernetes_secret.wiz_kube_connector_token]
}

data "kubernetes_secret" "service_account_token" {
  metadata {
    name      = format("%s-token", var.wiz_service_account_name)
    namespace = kubernetes_namespace.wiz.id
  }

  depends_on = [
    time_sleep.wait_5_seconds_for_token_generation
  ]
}

resource "wiz_kubernetes_connector" "connector" {
  name                         = local.kubernetes_connector_name
  service_account_token        = data.kubernetes_secret.service_account_token.data.token
  server_certificate_authority = base64encode(data.kubernetes_secret.service_account_token.data["ca.crt"])
  server_endpoint              = var.k8s_endpoint
  connector_type               = "eks"
  enabled                      = true
  is_private_cluster           = false
}
