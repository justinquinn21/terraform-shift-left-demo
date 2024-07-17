module "wiz_gcp_cloud_events" {
  count  = var.cloud_events ? 1 : 0
  source = "https://s3-us-east-2.amazonaws.com/wizio-public/deployment-v2/gcp/wiz-gcp-cloud-events-terraform-module.zip"

  integration_type      = "PROJECT"
  project_id            = var.project_id
  service_account_email = local.fetcher_service_account_id

  monitored_projects = []
}
