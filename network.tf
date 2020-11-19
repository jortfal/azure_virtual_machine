/* 
Copyright 2020 José Mnauel Ortega Falcón

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License. 
*/

resource "azurerm_network_interface" "this" {
  count = length(var.network_interface_list)

  name                = var.network_interface_list[count.index].name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name

  ip_configuration {
    name                          = var.network_interface_list[count.index].ip_configuration.name
    subnet_id                     = var.network_interface_list[count.index].ip_configuration.subnet_id
    private_ip_address_allocation = var.network_interface_list[count.index].ip_configuration.private_ip_address_allocation
    primary                       = var.network_interface_list[count.index].ip_configuration.primary
  }
}
