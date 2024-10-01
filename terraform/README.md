<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.3 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | =0.119.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.3 |
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.119.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_project_cluster"></a> [project\_cluster](#module\_project\_cluster) | ./modules/instance | n/a |

## Resources

| Name | Type |
|------|------|
| [null_resource.create_inventory](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.exec_ansible_playbook_apt](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.exec_ansible_playbook_k8s](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [yandex_vpc_network.network](https://registry.terraform.io/providers/yandex-cloud/yandex/0.119.0/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.subnet](https://registry.terraform.io/providers/yandex-cloud/yandex/0.119.0/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | Default cloud ID in yandex cloud | `string` | `"<cloud_id>"` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | Default folder ID in yandex cloud | `string` | `"<folder_id>"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip_address_app"></a> [external\_ip\_address\_app](#output\_external\_ip\_address\_app) | n/a |
| <a name="output_external_ip_address_master"></a> [external\_ip\_address\_master](#output\_external\_ip\_address\_master) | n/a |
| <a name="output_external_ip_address_srv"></a> [external\_ip\_address\_srv](#output\_external\_ip\_address\_srv) | n/a |
| <a name="output_internal_ip_address_app"></a> [internal\_ip\_address\_app](#output\_internal\_ip\_address\_app) | n/a |
| <a name="output_internal_ip_address_master"></a> [internal\_ip\_address\_master](#output\_internal\_ip\_address\_master) | n/a |
| <a name="output_internal_ip_address_srv"></a> [internal\_ip\_address\_srv](#output\_internal\_ip\_address\_srv) | n/a |
<!-- END_TF_DOCS -->