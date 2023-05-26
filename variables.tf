variable "argocd_application_name" {
  type        = string
  description = "The ArgoCD application name."
}

variable "argocd_application_namespace" {
  type        = string
  description = "The kubernetes namespace in which to deploy the defined application."
}

variable "argocd_destroy_wait" {
  type        = string
  description = "The time to wait after destroying ArgoCD applications before cluster teardown should occur."
  default     = "60s"
}

variable "eks_cluster_version" {
  type        = string
  description = "The kubernetes version for the EKS cluster."
  default     = "1.25"
}

variable "git_repo_url" {
  type        = string
  description = "The URL for the Git repository to use for deploying the desired application."
}

variable "git_repo_manifest_path" {
  type        = string
  description = "The path within the Git repository where kubernetes manifests for the desired application are stored."
}

variable "mapped_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap."
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))
  default = []
}

variable "mappped_users" {
  description = "Additional IAM users to add to the aws-auth configmap."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))
  default = []
}

variable "resource_prefix" {
  type        = string
  description = "The prefix to use for resource names."
  default     = "wiz-shift-left"
}

variable "region" {
  type        = string
  description = "The name of the AWS region to use"
  default     = "us-east-1"
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
