variable "project_id" {
  type = string
}

variable "wiz_managed_identity_external_id" {
  type    = string
  default = ""
}

variable "worker_service_account_id" {
  type    = string
  default = ""
}

variable "wiz_security_role_name" {
  type    = string
  default = "wiz_security_role"
}

variable "wiz_security_role_disk_analysis_ext_name" {
  type    = string
  default = "wiz_security_role_disk_analysis_ext"
}

variable "cloud_events" {
  type    = bool
  default = false
}

variable "data_scanning" {
  type    = bool
  default = false
}

variable "wiz_security_role_data_scanning_ext_name" {
  type    = string
  default = "wiz_security_role_data_scanning_ext"
}

variable "serverless_scanning" {
  type    = bool
  default = false
}

variable "wiz_security_role_serverless_scanning_ext_name" {
  type    = string
  default = "wiz_security_role_serverless_scanning_ext"
}

variable "forensic" {
  type    = bool
  default = false
}

variable "wiz_security_role_forensic_ext_name" {
  type    = string
  default = "wiz_security_role_forensic_ext"
}


variable "least_privilege_policy" {
  type    = bool
  default = false
}

variable "wiz_security_role_registry_scanning_ext_name" {
  type    = string
  default = "wiz_security_role_registry_scanning_ext"
}
