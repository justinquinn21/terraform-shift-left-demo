variable "cluster_version" {
  type        = string
  description = "The version of Kubernetes to run for the EKS cluster."
}

variable "cluster_wait" {
  type        = string
  description = "The time to wait after cluster creation before attempting to deploy resources."
  default     = "60s"
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

variable "mapped_users" {
  description = "Additional IAM users to add to the aws-auth configmap."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))
  default = []
}

variable "region" {
  default = "us-east-1"
}

variable "resource_prefix" {
  type        = string
  description = "The prefix to use for resource names."
  default     = "wiz-shift-left"
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
