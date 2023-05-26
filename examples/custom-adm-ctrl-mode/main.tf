module "default_shift_left_environment" {
  source = "../../"

  argocd_application_name      = "guestbook"
  argocd_application_namespace = "guestbook"
  git_repo_url                 = "https://github.com/argoproj/argocd-example-apps.git"
  git_repo_manifest_path       = "guestbook"

  use_wiz_admission_controller           = true
  wiz_admission_controller_client_id     = "<WIZ_ADM_CONTROLLER_CLIENT_ID>"
  wiz_admission_controller_client_secret = "<WIZ_ADM_CONTROLLER_CLIENT_SECRET>"
  wiz_admission_controller_mode          = "BLOCK"
}
