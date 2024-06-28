module "default_shift_left_environment" {
  source = "../../"

  argocd_application_name      = "nix-foundation"
  argocd_application_namespace = "nix-foundation"
  git_repo_url                 = "https://github.com/justinquinn21/sample_CI-CD.git"
  git_repo_manifest_path       = "manifests"

  wiz_k8s_integration_client_id     = "<WIZ_K8S_INTEGRATION_CLIENT_ID>"
  wiz_k8s_integration_client_secret = "<WIZ_K8S_INTEGRATION_CLIENT_PASSWORD>"

  use_wiz_admission_controller = true

  use_wiz_sensor           = true
  wiz_sensor_pull_username = "<WIZ_SENSOR_REGISTRY_USERNAME>"
  wiz_sensor_pull_password = "<WIZ_SENSOR_REGISTRY_PASSWORD>"
}

output "shift_left_environment_output" {
  value = module.default_shift_left_environment
}