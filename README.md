# azure_virtual_machine

![GitHub release (latest by date)](https://img.shields.io/github/v/release/jortfal/azure_virtual_machine)
![GitHub Release Date](https://img.shields.io/github/release-date/jortfal/azure_virtual_machine)
![GitHub license](https://img.shields.io/github/license/jortfal/azure_virtual_machine)
![Maintenance](https://img.shields.io/maintenance/yes/2021?color=green)
![Maintainer](https://img.shields.io/badge/maintainer-jortfal-green)

Module of Terraform to created a Virtual Machine, linux or windows, in Microsoft Azure.

## Features

TO DO

## Usage

TO DO

## Examples

TO DO

## Known issues

No issue is creating limit on this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0, <= 0.14.10 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.30.0, <= 2.54.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 2.30.0, <= 2.54.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_interface.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_virtual_machine.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine) | resource |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_delete_data_disks_on_termination"></a> [delete\_data\_disks\_on\_termination](#input\_delete\_data\_disks\_on\_termination) | True to delete the data disks automatically when deleting the VM | `bool` | `false` | no |
| <a name="input_delete_os_disk_on_termination"></a> [delete\_os\_disk\_on\_termination](#input\_delete\_os\_disk\_on\_termination) | True to delete the OS disk automatically when deleting the VM | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of virtual machine | `string` | n/a | yes |
| <a name="input_network_interface_list"></a> [network\_interface\_list](#input\_network\_interface\_list) | A list of network interfaces | <pre>list(<br>    object({<br>      name = string<br>      ip_configuration = object({<br>        name                          = string<br>        subnet_id                     = string<br>        private_ip_address_allocation = string<br>        primary                       = bool<br>      })<br>    })<br>  )</pre> | `[]` | no |
| <a name="input_os_profile"></a> [os\_profile](#input\_os\_profile) | Settings of virtual machine | <pre>object({<br>    computer_name  = string<br>    admin_username = string<br>    admin_password = string<br>  })</pre> | n/a | yes |
| <a name="input_os_profile_linux_config"></a> [os\_profile\_linux\_config](#input\_os\_profile\_linux\_config) | Config profile of linux | `map(bool)` | <pre>{<br>  "disable_password_authentication": false<br>}</pre> | no |
| <a name="input_os_profile_windows_config"></a> [os\_profile\_windows\_config](#input\_os\_profile\_windows\_config) | Config profile of windows os | `map(bool)` | <pre>{<br>  "enable_automatic_upgrades": false,<br>  "provision_vm_agent": false<br>}</pre> | no |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | The type of os, it can be 'linux' or 'windows' | `string` | `null` | no |
| <a name="input_primary_network_interface_id"></a> [primary\_network\_interface\_id](#input\_primary\_network\_interface\_id) | The ID of the primary network interface | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of resource group where to create the virtual machine | `string` | n/a | yes |
| <a name="input_storage_data_disk_list"></a> [storage\_data\_disk\_list](#input\_storage\_data\_disk\_list) | A list of data disk | <pre>list(object({<br>    name                      = string<br>    caching                   = string<br>    create_option             = string<br>    disk_size_gb              = number<br>    lun                       = number<br>    write_accelerator_enabled = bool<br>    managed_disk_type         = string<br>    managed_disk_id           = string<br>  }))</pre> | `[]` | no |
| <a name="input_storage_image_reference"></a> [storage\_image\_reference](#input\_storage\_image\_reference) | The image reference of virtual machine | <pre>object({<br>    publisher = string<br>    offer     = string<br>    sku       = string<br>    version   = string<br>  })</pre> | n/a | yes |
| <a name="input_storage_image_reference_id"></a> [storage\_image\_reference\_id](#input\_storage\_image\_reference\_id) | The ID of the Custom Image which the Virtual Machine should be created from | `string` | `null` | no |
| <a name="input_storage_os_disk"></a> [storage\_os\_disk](#input\_storage\_os\_disk) | The storage os disk settings | <pre>object({<br>    name              = string<br>    caching           = string<br>    create_option     = string<br>    managed_disk_type = string<br>  })</pre> | <pre>{<br>  "caching": null,<br>  "create_option": null,<br>  "managed_disk_type": null,<br>  "name": null<br>}</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to security group | `map(string)` | `{}` | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | The size of virtual machine | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Virtual Machine |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Tests

### Terraform fmt - Style Conventions

Rewrites all Terraform configuration files to a canonical format. Both configuration files (.tf) and variables files (.tfvars) are updated.

- [Documentation](https://www.terraform.io/docs/cli/commands/fmt.html)

#### To display diffs of formatting changes

```bash
# $ terraform fmt --help
# Usage:
#   terraform fmt [options] [DIR]

$ terraform fmt -check --recursive --diff
```

#### To rewrite Terraform configuration files to a canonical format and style

```bash
# $ terraform fmt --help
# Usage:
#   terraform fmt [options] [DIR]

$ terraform fmt --recursive
```

### TFLint

The configuration of TFLint can be found in the file `.tflint.-hcl`

- [Documentation](https://github.com/terraform-linters/tflint/blob/master/README.md)

- [User Guide](https://github.com/terraform-linters/tflint/tree/master/docs/user-guide)

```bash
# $ tflint --help
# Usage:
#   tflint [OPTIONS] [FILE or DIR...]

$ tflint
```

### Terraform validate

Validate the configuration files in a directory, referring only to the configuration 
and not accessing any remote services such as remote state, provider APIs, etc.

- [Documentation](https://www.terraform.io/docs/cli/commands/validate.html)

```bash
# $ terraform validate --help
# Usage:
#   terraform validate [options] [dir]
$ terraform init -backend=false
$ terraform validate
```

### Terraform TFSec

### Terraform Docs

## Authors

Module managed by [jortfal | Jose Manuel Ortega Falcon](https://github.com/jortfal).

## License

Apache 2 Licensed. See `LICENSE` file for full details.
