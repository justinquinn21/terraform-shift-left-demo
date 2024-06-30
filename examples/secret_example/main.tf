module "default_shift_left_environment" {
  source = "../../"

  argocd_application_name      = "nix-foundation"
  argocd_application_namespace = "nix-foundation"
  git_repo_url                 = "https://github.com/justinquinn21/sample_CI-CD.git"
  git_repo_manifest_path       = "manifests"

  wiz_k8s_integration_client_id     = "wgxq75hrlndpbktx3eupevf2xywdbs7llunfy6u4zub24qwebkdwm"
  wiz_k8s_integration_client_secret = "85U2vFJoiguXcUd6MWPBRepNUPKBckYmhW7TTo8FJYY3whB9QvHYHzsoys1BnoR5"

  use_wiz_admission_controller = true

  use_wiz_sensor           = true
  wiz_sensor_pull_username = "<WIZ_SENSOR_REGISTRY_USERNAME>"
  wiz_sensor_pull_password = "<WIZ_SENSOR_REGISTRY_PASSWORD>"

  aws_access_key_id: "AKIA6KJQR5EGTCVYCLKT",
  aws_secret_access_key: "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",
}

output "shift_left_environment_output" {
  value = module.default_shift_left_environment
}