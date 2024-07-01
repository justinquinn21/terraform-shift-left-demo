variable "access_entries" {
  description = "Map of access entries to add to the cluster"
  type        = any
}

variable "cluster_admins" {
  type        = list(string)
  description = "A list containing the ARNs of users/roles that should be cluster administrators."
  default     = []
}

variable "cluster_version" {
  type        = string
  description = "The version of Kubernetes to run for the EKS cluster."
}

variable "cluster_wait" {
  type        = string
  description = "The time to wait after cluster creation before attempting to deploy resources."
  default     = "60s"
}

variable "karpenter_chart_verison" {
  type        = string
  description = "A string representing the version of the Karpenter Helm chart to deploy."
}

variable "region" {
  default = "us-east-1"
}

variable "resource_prefix" {
  type        = string
  description = "The prefix to use for resource names."
  default     = "quinn-shift-left"
}

variable "tags" {
  description = "Tags to assign for all resources"
  type        = map(string)
  default     = {}
}

variable "vpc_cidr" {
  type        = string
  description = "The CIDR subnet address for the VPC"
  default     = "10.0.0.0/16"
}
