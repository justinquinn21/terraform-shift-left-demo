<!-- BEGIN_TF_DOCS -->

# Shift Left Demo Terraform Module

A Terraform module to deploy a "Shift Left" environment and cloud-native application.

## Requirements

| Name       | Version |
| ---------- | ------- |
| terraform  | >= 1.0  |
| aws        | ~> 4.47 |
| helm       | ~> 2.7  |
| kubectl    | ~> 1.14 |
| kubernetes | ~> 2.10 |

## Providers

| Name       | Version |
| ---------- | ------- |
| kubectl    | ~> 1.14 |
| kubernetes | ~> 2.10 |
| time       | n/a     |

## Modules

| Name         | Source                 | Version |
| ------------ | ---------------------- | ------- |
| eks_cluster  | ./modules/eks-cluster  | n/a     |
| eks_services | ./modules/eks-services | n/a     |

## Resources

| Name                                                                                                                                    | Type        |
| --------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [kubectl_manifest.argo_cd_application](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest)      | resource    |
| [time_sleep.argo_wait](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep)                              | resource    |
| [kubernetes_secret_v1.argocd_password](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/secret_v1) | data source |
| [kubernetes_service.argocd_service](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/service)      | data source |

## Inputs

| Name                              | Description                                                                                                                                                                     | Type                                                                                                  | Default            | Required |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ------------------ | :------: |
| argocd_application_name           | A string representing the ArgoCD application name. (Required if `deploy_argocd_application` is `true`)                                                                          | `string`                                                                                              | `""`               |    no    |
| argocd_application_namespace      | A string representing the kubernetes namespace in which to deploy the defined application. (Required if `deploy_argocd_application` is `true`)                                  | `string`                                                                                              | `""`               |    no    |
| argocd_destroy_wait               | A string represeting the time to wait after destroying ArgoCD applications before cluster teardown should occur.                                                                | `string`                                                                                              | `"60s"`            |    no    |
| deploy_argocd_application         | A boolean representing whether the module should automatically deploy an ArgoCD application.                                                                                    | `bool`                                                                                                | `true`             |    no    |
| eks_cluster_version               | A string representing the desired kubernetes version for the EKS cluster.                                                                                                       | `string`                                                                                              | `"1.25"`           |    no    |
| git_repo_manifest_path            | A string representing the path within the Git repository where kubernetes manifests for the desired application are stored. (Required if `deploy_argocd_application` is `true`) | `string`                                                                                              | `""`               |    no    |
| git_repo_url                      | A string representing the URL for the Git repository to use for deploying the desired application. (Required if `deploy_argocd_application` is `true`)                          | `string`                                                                                              | `""`               |    no    |
| mapped_roles                      | A list of objects representing additional IAM roles to add to the aws-auth configmap.                                                                                           | <pre>list(object({<br> rolearn = string<br> username = string<br> groups = list(string)<br> }))</pre> | `[]`               |    no    |
| mappped_users                     | A list of objects representing additional IAM users to add to the aws-auth configmap.                                                                                           | <pre>list(object({<br> userarn = string<br> username = string<br> groups = list(string)<br> }))</pre> | `[]`               |    no    |
| region                            | A string representing the name of the AWS region to use.                                                                                                                        | `string`                                                                                              | `"us-east-1"`      |    no    |
| resource_prefix                   | A string representing the prefix to use for resource names.                                                                                                                     | `string`                                                                                              | `"wiz-shift-left"` |    no    |
| use_wiz_admission_controller      | A boolean representing whether or not to deploy the Wiz Admission Controller in the EKS cluster.                                                                                | `bool`                                                                                                | `false`            |    no    |
| use_wiz_sensor                    | A boolean representing whether or not to deploy the Wiz Sensor in the EKS cluster.                                                                                              | `bool`                                                                                                | `false`            |    no    |
| wiz_admission_controller_mode     | A string representing the mode in which the Wiz Admission Controller should operate.                                                                                            | `string`                                                                                              | `"AUDIT"`          |    no    |
| wiz_admission_controller_policies | A list of strings representing the Wiz Admission Controller policies that should be enforced.                                                                                   | `list(string)`                                                                                        | `[]`               |    no    |
| wiz_k8s_integration_client_id     | A string representing the Client ID for the Wiz Sensor service account.                                                                                                         | `string`                                                                                              | `""`               |    no    |
| wiz_k8s_integration_client_secret | A string representing the Client Secret for the Wiz Sensor service account.                                                                                                     | `string`                                                                                              | `""`               |    no    |
| wiz_sensor_pull_password          | A string representing the image pull password for Wiz container images.                                                                                                         | `string`                                                                                              | `""`               |    no    |
| wiz_sensor_pull_username          | A string representing the image pull username for Wiz container images.                                                                                                         | `string`                                                                                              | `""`               |    no    |

## Outputs

| Name                      | Description |
| ------------------------- | ----------- |
| argocd_password           | n/a         |
| argocd_url                | n/a         |
| kubernetes_connector_name | n/a         |

<!-- END_TF_DOCS -->
