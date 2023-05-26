variable "k8s_ca_certificate" {
  type        = string
  description = "The Kubernetes CA certificate"
}

variable "k8s_endpoint" {
  type        = string
  description = "The Kubernetes host endpoint"
}

variable "k8s_token" {
  type        = string
  description = "The Kubernetes access token"
}

variable "resource_prefix" {
  type        = string
  description = "The prefix to use for resource names."
  default     = "wiz-shift-left"
}

variable "wiz_service_account_name" {
  type    = string
  default = "wiz-kube-connector"
}

variable "wiz_namespace" {
  type    = string
  default = "wiz"
}

variable "wiz_admission_controller_client_id" {
  type    = string
  default = ""
}

variable "wiz_admission_controller_client_secret" {
  type    = string
  default = ""
}

variable "wiz_admission_controller_mode" {
  type    = string
  default = "AUDIT"
  validation {
    condition     = contains(["AUDIT", "BLOCK"], var.wiz_admission_controller_mode)
    error_message = "Enforcement mode must either be 'AUDIT' or 'BLOCK'"
  }
}

variable "wiz_admission_controller_policies" {
  type    = list(string)
  default = []
}

variable "use_wiz_admission_controller" {
  type    = bool
  default = false
}
