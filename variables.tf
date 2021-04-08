/* 
Copyright 2021 jortfal | José Mnauel Ortega Falcón

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

# Global Variables

# Data Sources Input Variables

variable "resource_group_name" {
  description = "The name of resource group where to create the virtual machine"
  type        = string
}

# Module Variables

variable "name" {
  description = "The name of virtual machine"
  type        = string
}

variable "vm_size" {
  description = "The size of virtual machine"
  type        = string
}

variable "os_type" {
  description = "The type of os, it can be 'linux' or 'windows'"
  type        = string
  default     = null
}

variable "storage_image_reference" {
  description = "The image reference of virtual machine"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}

variable "storage_image_reference_id" {
  description = "The ID of the Custom Image which the Virtual Machine should be created from"
  type        = string
  default     = null
}

variable "storage_os_disk" {
  description = "The storage os disk settings"
  type = object({
    name              = string
    caching           = string
    create_option     = string
    managed_disk_type = string
  })
  default = {
    name              = null
    caching           = null
    create_option     = null
    managed_disk_type = null
  }
}

variable "delete_os_disk_on_termination" {
  description = "True to delete the OS disk automatically when deleting the VM"
  type        = bool
  default     = false
}

variable "storage_data_disk_list" {
  description = "A list of data disk"
  type = list(object({
    name                      = string
    caching                   = string
    create_option             = string
    disk_size_gb              = number
    lun                       = number
    write_accelerator_enabled = bool
    managed_disk_type         = string
    managed_disk_id           = string
  }))
  default = []
}

variable "delete_data_disks_on_termination" {
  description = "True to delete the data disks automatically when deleting the VM"
  type        = bool
  default     = false
}

variable "os_profile" {
  description = "Settings of virtual machine"
  type = object({
    computer_name  = string
    admin_username = string
    admin_password = string
  })
}

variable "os_profile_linux_config" {
  description = "Config profile of linux"
  type        = map(bool)
  default = {
    disable_password_authentication = false
  }
}

variable "os_profile_windows_config" {
  description = "Config profile of windows os"
  type        = map(bool)
  default = {
    provision_vm_agent        = false
    enable_automatic_upgrades = false
  }
}

variable "network_interface_list" {
  description = "A list of network interfaces"
  type = list(
    object({
      name = string
      ip_configuration = object({
        name                          = string
        subnet_id                     = string
        private_ip_address_allocation = string
        primary                       = bool
      })
    })
  )
  default = []
}

variable "primary_network_interface_id" {
  description = "The ID of the primary network interface"
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to security group"
  type        = map(string)
  default     = {}
}
