variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for VM network interfaces"
  type        = string
}

variable "vms" {
  description = "Map of VMs to create"
  type = map(object({
    name            = string
    size            = string
    image_publisher = string
    image_offer     = string
    image_sku       = string
    image_version   = string
  }))
}

variable "admin_username" {
  description = "Admin username for VMs"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  description = "Path to SSH public key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default     = {}
}