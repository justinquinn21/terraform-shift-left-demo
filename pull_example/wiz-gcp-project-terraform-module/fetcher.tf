resource "google_project_iam_custom_role" "wiz_security_role" {
  role_id     = var.wiz_security_role_name
  project     = var.project_id
  title       = var.wiz_security_role_name
  permissions = var.least_privilege_policy ? local.least_privileged_statements : var.standard_statements
}

resource "google_project_iam_member" "fetcher_roles" {
  for_each   = local.fetcher_roles
  project    = var.project_id
  role       = each.value
  member     = "serviceAccount:${local.fetcher_service_account_id}"
  depends_on = [google_project_iam_custom_role.wiz_security_role]
}
