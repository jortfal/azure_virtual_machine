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

# Windows Virtual Machine
resource "azurerm_virtual_machine" "this-w-custom" {
  count = var.os_type == "windows-custom-image" ? 1 : 0

  name                         = var.name
  location                     = data.azurerm_resource_group.this.location
  resource_group_name          = data.azurerm_resource_group.this.name
  network_interface_ids        = azurerm_network_interface.this.*.id
  primary_network_interface_id = var.primary_network_interface_id == null ? azurerm_network_interface.this.0.id : var.primary_network_interface_id
  vm_size                      = var.vm_size

  delete_os_disk_on_termination    = var.delete_os_disk_on_termination
  delete_data_disks_on_termination = var.delete_data_disks_on_termination

  storage_image_reference {    
    id = var.storage_image_reference_id
  }

  storage_os_disk {
    name              = var.storage_os_disk.name
    caching           = var.storage_os_disk.caching
    create_option     = var.storage_os_disk.create_option
    managed_disk_type = var.storage_os_disk.managed_disk_type
  }

  dynamic "storage_data_disk" {
    for_each = var.storage_data_disk_list
    content {
      name = storage_data_disk.value["name"]
      caching = storage_data_disk.value["caching"]
      create_option = storage_data_disk.value["create_option"]
      disk_size_gb = storage_data_disk.value["disk_size_gb"]
      lun = storage_data_disk.value["lun"]
      write_accelerator_enabled = storage_data_disk.value["write_accelerator_enabled"]
      managed_disk_type = storage_data_disk.value["managed_disk_type"] 
      managed_disk_id = storage_data_disk.value["managed_disk_id"]
    }
  }

  os_profile {
    computer_name  = var.os_profile.computer_name
    admin_username = var.os_profile.admin_username
    admin_password = var.os_profile.admin_password
  }
    
  os_profile_windows_config {
    provision_vm_agent = var.os_profile_windows_config.provision_vm_agent
    enable_automatic_upgrades = var.os_profile_windows_config.enable_automatic_upgrades
  }

  tags = merge(
    {
      "name"     = format("%s", var.name)
      "resource" = "virtual_machine"
    },
    var.tags,
  )
}
