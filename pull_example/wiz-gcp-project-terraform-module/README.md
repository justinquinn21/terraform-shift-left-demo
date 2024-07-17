<!-- BEGIN_TF_DOCS -->
# wiz-gcp-project-terraform-module

A Terraform module to integrate Google Cloud Projects with Wiz.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| google | >= 4.1 |
| time | ~> 0.10.0 |

## Providers

| Name | Version |
|------|---------|
| google | >= 4.1 |
| time | ~> 0.10.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| wiz\_gcp\_cloud\_events | https://s3-us-east-2.amazonaws.com/wizio-public/deployment-v2/gcp/wiz-gcp-cloud-events-terraform-module.zip | n/a |

## Resources

| Name | Type |
|------|------|
| [google_project_iam_custom_role.wiz_security_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_custom_role) | resource |
| [google_project_iam_custom_role.wiz_security_role_data_scanning_ext](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_custom_role) | resource |
| [google_project_iam_custom_role.wiz_security_role_disk_analysis_ext](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_custom_role) | resource |
| [google_project_iam_custom_role.wiz_security_role_forensic_ext](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_custom_role) | resource |
| [google_project_iam_custom_role.wiz_security_role_registry_scanning_ext](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_custom_role) | resource |
| [google_project_iam_custom_role.wiz_security_role_serverless_scanning_ext](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_custom_role) | resource |
| [google_project_iam_member.disk_analysis_roles](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.fetcher_roles](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.wiz_da_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.wiz_worker_security_role_data_scanning_ext](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.wiz_worker_security_role_forensic_ext](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.wiz_worker_security_role_registry_scanning_ext](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.wiz_worker_security_role_serverless_scanning_ext](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_service.required_apis](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_service_account.wiz-service-account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_iam_binding.fetcher_self_impersonation_roles](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_binding) | resource |
| [time_sleep.required_apis](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project\_id | n/a | `string` | n/a | yes |
| cloud\_events | n/a | `bool` | `false` | no |
| data\_scanning | n/a | `bool` | `false` | no |
| forensic | n/a | `bool` | `false` | no |
| least\_privilege\_policy | n/a | `bool` | `false` | no |
| least\_privileged\_statements\_wiz | n/a | `list(string)` | <pre>[<br>  "alloydb.backups.list",<br>  "alloydb.clusters.list",<br>  "alloydb.instances.list",<br>  "apikeys.keys.list",<br>  "appengine.applications.get",<br>  "appengine.services.list",<br>  "artifactregistry.repositories.list",<br>  "bigquery.datasets.get",<br>  "bigtable.clusters.list",<br>  "bigtable.instances.getIamPolicy",<br>  "bigtable.instances.list",<br>  "certificatemanager.certs.list",<br>  "cloudfunctions.functions.get",<br>  "cloudfunctions.functions.list",<br>  "cloudkms.cryptoKeys.getIamPolicy",<br>  "cloudkms.cryptoKeys.list",<br>  "cloudkms.keyRings.getIamPolicy",<br>  "cloudkms.keyRings.list",<br>  "cloudsql.databases.list",<br>  "cloudsql.instances.get",<br>  "cloudsql.instances.list",<br>  "composer.environments.list",<br>  "cloudsql.users.get",<br>  "cloudsql.users.list",<br>  "compute.addresses.list",<br>  "compute.backendBuckets.list",<br>  "compute.backendServices.list",<br>  "compute.disks.getIamPolicy",<br>  "compute.disks.list",<br>  "compute.externalVpnGateways.list",<br>  "compute.firewalls.list",<br>  "compute.forwardingRules.list",<br>  "compute.images.get",<br>  "compute.images.getIamPolicy",<br>  "compute.instanceGroupManagers.list",<br>  "compute.instanceGroups.list",<br>  "compute.instances.get",<br>  "compute.instances.getIamPolicy",<br>  "compute.instances.list",<br>  "compute.machineTypes.get",<br>  "compute.networkEndpointGroups.get",<br>  "compute.networkEndpointGroups.list",<br>  "compute.networks.list",<br>  "compute.projects.get",<br>  "compute.regionBackendServices.list",<br>  "compute.routers.list",<br>  "compute.routes.list",<br>  "compute.snapshots.list",<br>  "compute.sslCertificates.list",<br>  "compute.sslPolicies.list",<br>  "compute.subnetworks.list",<br>  "compute.targetHttpProxies.list",<br>  "compute.targetHttpsProxies.list",<br>  "compute.targetPools.list",<br>  "compute.targetSslProxies.list",<br>  "compute.targetTcpProxies.list",<br>  "compute.targetVpnGateways.list",<br>  "compute.urlMaps.get",<br>  "compute.urlMaps.list",<br>  "compute.vpnGateways.list",<br>  "container.clusters.list",<br>  "dataproc.clusters.getIamPolicy",<br>  "dataproc.clusters.list",<br>  "datastore.databases.list",<br>  "dns.managedZones.list",<br>  "dns.responsePolicies.get",<br>  "dns.responsePolicies.list",<br>  "file.instances.list",<br>  "firebaserules.rulesets.get",<br>  "firebaserules.rulesets.list",<br>  "iam.roles.get",<br>  "iam.roles.list",<br>  "iam.serviceAccountKeys.list",<br>  "iam.serviceAccounts.getIamPolicy",<br>  "iam.serviceAccounts.list",<br>  "iam.workloadIdentityPools.list",<br>  "logging.logMetrics.list",<br>  "logging.sinks.list",<br>  "memcache.instances.list",<br>  "memcache.locations.list",<br>  "orgpolicy.policies.list",<br>  "orgpolicy.policy.get",<br>  "policyanalyzer.serviceAccountKeyLastAuthenticationActivities.query",<br>  "pubsub.subscriptions.getIamPolicy",<br>  "pubsub.subscriptions.list",<br>  "pubsub.topics.list",<br>  "recommender.iamPolicyInsights.list",<br>  "recommender.iamPolicyRecommendations.get",<br>  "recommender.iamPolicyRecommendations.list",<br>  "recommender.iamServiceAccountInsights.list",<br>  "redis.instances.list",<br>  "redis.locations.list",<br>  "resourcemanager.folders.getIamPolicy",<br>  "resourcemanager.folders.list",<br>  "resourcemanager.organizations.get",<br>  "resourcemanager.organizations.getIamPolicy",<br>  "resourcemanager.projects.get",<br>  "resourcemanager.projects.getIamPolicy",<br>  "run.revisions.get",<br>  "run.services.get",<br>  "run.services.getIamPolicy",<br>  "run.services.list",<br>  "secretmanager.secrets.list",<br>  "securitycenter.findings.list",<br>  "serviceusage.services.list",<br>  "servicemanagement.services.get",<br>  "servicemanagement.services.list",<br>  "serviceusage.services.list",<br>  "spanner.databases.getIamPolicy",<br>  "spanner.databases.list",<br>  "spanner.instances.getIamPolicy",<br>  "spanner.instances.list",<br>  "storage.buckets.getIamPolicy",<br>  "storage.buckets.list"<br>]</pre> | no |
| project\_service\_wait\_time | Amount of time to wait after enabling the required Google Cloud APIs | `string` | `"10s"` | no |
| required\_apis | n/a | `map(string)` | <pre>{<br>  "accessapproval": "accessapproval.googleapis.com",<br>  "accesscontextmanager": "accesscontextmanager.googleapis.com",<br>  "apikeys": "apikeys.googleapis.com",<br>  "appengine": "appengine.googleapis.com",<br>  "bigquery": "bigquery.googleapis.com",<br>  "bigquerystorage": "bigquerystorage.googleapis.com",<br>  "bigtableadmin": "bigtableadmin.googleapis.com",<br>  "certificatemanager": "certificatemanager.googleapis.com",<br>  "cloudapis": "cloudapis.googleapis.com",<br>  "cloudasset": "cloudasset.googleapis.com",<br>  "cloudfunctions": "cloudfunctions.googleapis.com",<br>  "cloudkms": "cloudkms.googleapis.com",<br>  "cloudresourcemanager": "cloudresourcemanager.googleapis.com",<br>  "composer": "composer.googleapis.com",<br>  "compute": "compute.googleapis.com",<br>  "container": "container.googleapis.com",<br>  "dns": "dns.googleapis.com",<br>  "essentialcontacts": "essentialcontacts.googleapis.com",<br>  "file": "file.googleapis.com",<br>  "firebaserules": "firebaserules.googleapis.com",<br>  "iam": "iam.googleapis.com",<br>  "identitytoolkit": "identitytoolkit.googleapis.com",<br>  "memcache": "memcache.googleapis.com",<br>  "policyanalyzer": "policyanalyzer.googleapis.com",<br>  "pubsub": "pubsub.googleapis.com",<br>  "recommender": "recommender.googleapis.com",<br>  "redis": "redis.googleapis.com",<br>  "run": "run.googleapis.com",<br>  "secretmanager": "secretmanager.googleapis.com",<br>  "securitycenter": "securitycenter.googleapis.com",<br>  "servicemanagement": "servicemanagement.googleapis.com",<br>  "servicenetworking": "servicenetworking.googleapis.com",<br>  "serviceusage": "serviceusage.googleapis.com",<br>  "spanner": "spanner.googleapis.com",<br>  "sqladmin": "sqladmin.googleapis.com"<br>}</pre> | no |
| serverless\_scanning | n/a | `bool` | `false` | no |
| standard\_statements | n/a | `list(string)` | <pre>[<br>  "firebaserules.rulesets.get",<br>  "firebaserules.rulesets.list",<br>  "storage.buckets.get",<br>  "storage.objects.get"<br>]</pre> | no |
| wiz\_managed\_identity\_external\_id | n/a | `string` | `""` | no |
| wiz\_security\_role\_data\_scanning\_ext\_name | n/a | `string` | `"wiz_security_role_data_scanning_ext"` | no |
| wiz\_security\_role\_disk\_analysis\_ext\_name | n/a | `string` | `"wiz_security_role_disk_analysis_ext"` | no |
| wiz\_security\_role\_forensic\_ext\_name | n/a | `string` | `"wiz_security_role_forensic_ext"` | no |
| wiz\_security\_role\_name | n/a | `string` | `"wiz_security_role"` | no |
| wiz\_security\_role\_registry\_scanning\_ext\_name | n/a | `string` | `"wiz_security_role_registry_scanning_ext"` | no |
| wiz\_security\_role\_serverless\_scanning\_ext\_name | n/a | `string` | `"wiz_security_role_serverless_scanning_ext"` | no |
| wiz\_service\_account\_name | n/a | `string` | `"wiz-service-account"` | no |
| worker\_service\_account\_id | n/a | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| cloud\_events\_subscription\_id | n/a |
| cloud\_events\_topic | n/a |
<!-- END_TF_DOCS -->