<!-- BEGIN_TF_DOCS -->
# Shift Left Demo Terraform Module

A Terraform module to deploy a "Shift Left" environment and cloud-native application.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| aws | ~> 4.47 |
| helm | ~> 2.7 |
| kubectl | ~> 1.14 |
| kubernetes | ~> 2.10 |

## Providers

| Name | Version |
|------|---------|
| kubectl | ~> 1.14 |
| kubernetes | ~> 2.10 |
| time | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| eks\_cluster | ./modules/eks-cluster | n/a |
| eks\_services | ./modules/eks-services | n/a |

## Resources

| Name | Type |
|------|------|
| [kubectl_manifest.argo_cd_application](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [time_sleep.argo_wait](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [kubernetes_secret_v1.argocd_password](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/secret_v1) | data source |
| [kubernetes_service.argocd_service](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/service) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| argocd\_application\_name | The ArgoCD application name. | `string` | n/a | yes |
| argocd\_application\_namespace | The kubernetes namespace in which to deploy the defined application. | `string` | n/a | yes |
| git\_repo\_manifest\_path | The path within the Git repository where kubernetes manifests for the desired application are stored. | `string` | n/a | yes |
| git\_repo\_url | The URL for the Git repository to use for deploying the desired application. | `string` | n/a | yes |
| argocd\_destroy\_wait | The time to wait after destroying ArgoCD applications before cluster teardown should occur. | `string` | `"60s"` | no |
| eks\_cluster\_version | The kubernetes version for the EKS cluster. | `string` | `"1.25"` | no |
| mapped\_roles | Additional IAM roles to add to the aws-auth configmap. | <pre>list(object({<br>    rolearn  = string<br>    username = string<br>    groups   = list(string)<br>  }))</pre> | `[]` | no |
| mappped\_users | Additional IAM users to add to the aws-auth configmap. | <pre>list(object({<br>    userarn  = string<br>    username = string<br>    groups   = list(string)<br>  }))</pre> | `[]` | no |
| region | The name of the AWS region to use | `string` | `"us-east-1"` | no |
| resource\_prefix | The prefix to use for resource names. | `string` | `"wiz-shift-left"` | no |
| use\_wiz\_admission\_controller | n/a | `bool` | `false` | no |
| wiz\_admission\_controller\_client\_id | n/a | `string` | `""` | no |
| wiz\_admission\_controller\_client\_secret | n/a | `string` | `""` | no |
| wiz\_admission\_controller\_mode | n/a | `string` | `"AUDIT"` | no |
| wiz\_admission\_controller\_policies | n/a | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| argocd\_password | n/a |
| argocd\_url | n/a |
| kubernetes\_connector\_name | n/a |
<!-- END_TF_DOCS -->