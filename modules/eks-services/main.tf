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

resource "helm_release" "wiz_k8s_integration" {
  name       = "wiz-kubernetes-integration"
  repository = "https://wiz-sec.github.io/charts/"
  chart      = "wiz-kubernetes-integration"
  namespace  = kubernetes_namespace.wiz.id

  // Global
  set {
    name  = "global.wizApiToken.clientId"
    value = var.wiz_k8s_integration_client_id
  }
  set {
    name  = "global.wizApiToken.clientToken"
    value = var.wiz_k8s_integration_client_secret
  }

  // K8s Connector
  set {
    name  = "wiz-kubernetes-connector.enabled"
    value = true
  }
  set {
    name  = "wiz-kubernetes-connector.broker.enabled"
    value = false
  }
  set {
    name  = "wiz-kubernetes-connector.autoCreateConnector.connectorName"
    value = local.kubernetes_connector_name
  }
  set {
    name  = "wiz-kubernetes-connector.autoCreateConnector.clusterFlavor"
    value = "EKS"
  }
  set {
    name  = "wiz-kubernetes-connector.autoCreateConnector.apiServerEndpoint"
    value = var.k8s_endpoint
  }

  // Admission Controller
  set {
    name  = "wiz-admission-controller.enabled"
    value = var.use_wiz_admission_controller
  }
  set {
    name  = "wiz-admission-controller.opaWebhook.errorEnforcementMethod"
    value = var.wiz_admission_controller_mode
  }
  set {
    name  = "wiz-admission-controller.opaWebhook.policyEnforcementMethod"
    value = var.wiz_admission_controller_mode
  }
  dynamic "set" {
    for_each = var.wiz_admission_controller_policies
    content {
      name  = "wiz-admission-controller.opaWebhook.policies[${index(var.wiz_admission_controller_policies, set.value)}]"
      value = set.value
    }
  }

  // Sensor
  set {
    name  = "wiz-sensor.enabled"
    value = var.use_wiz_sensor
  }
  set {
    name  = "wiz-sensor.imagePullSecret.username"
    value = var.wiz_sensor_pull_username
  }
  set {
    name  = "wiz-sensor.imagePullSecret.password"
    value = var.wiz_sensor_pull_password
  }
}
